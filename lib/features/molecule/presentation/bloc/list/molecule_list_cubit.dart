import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/network/load_exception.dart';
import '../../../domain/i_molecule_repository.dart';
import '../../../domain/molecule_model.dart';
import 'molecule_list_state.dart';

class MoleculeListCubit extends Cubit<MoleculeListState> {
  MoleculeListCubit(this._repository)
    : super(MoleculeListState(molecules: [], query: ''));

  final IMoleculeRepository _repository;
  Timer? _searchDebounce;
  int _requestId = 0;

  Future<void> load() async {
    if (isClosed) return;
    _searchDebounce?.cancel();
    final requestId = ++_requestId;
    final query = state.query;
    emit(MoleculeListState(molecules: [], query: query));

    try {
      final page = await _repository.getMolecules(query: query);
      if (isClosed || requestId != _requestId) return;

      emit(
        MoleculeListState(
          query: query,
          molecules: page.molecules,
          totalCount: page.totalCount,
          nextOffset: page.nextOffset,
          status: MoleculeListStatus.loaded,
        ),
      );
    } on LoadException catch (error) {
      if (isClosed || requestId != _requestId) return;
      emit(state.copyWith(status: MoleculeListStatus.failure, error: error));
    }
  }

  Future<void> loadMore({bool retry = false}) async {
    if (isClosed || state.nextOffset == null) return;
    if (state.status != MoleculeListStatus.loaded &&
        !(retry && state.status == MoleculeListStatus.loadMoreFailure)) {
      return;
    }

    final requestId = _requestId;
    final query = state.query;
    final offset = state.nextOffset!;
    emit(state.copyWith(status: MoleculeListStatus.loadingMore));

    try {
      final page = await _repository.getMolecules(query: query, offset: offset);
      if (isClosed || requestId != _requestId) return;

      final byId = <String, MoleculeModel>{
        for (final molecule in state.molecules) molecule.id: molecule,
        for (final molecule in page.molecules) molecule.id: molecule,
      };
      emit(
        MoleculeListState(
          molecules: byId.values.toList(),
          query: query,
          totalCount: page.totalCount,
          nextOffset: page.nextOffset,
          status: MoleculeListStatus.loaded,
        ),
      );
    } on LoadException catch (error) {
      if (isClosed || requestId != _requestId) return;
      emit(
        state.copyWith(
          status: MoleculeListStatus.loadMoreFailure,
          error: error,
        ),
      );
    }
  }

  void search(String query) {
    if (isClosed || query == state.query) return;
    _searchDebounce?.cancel();
    _requestId++;
    emit(MoleculeListState(molecules: [], query: query));
    _searchDebounce = Timer(
      const Duration(milliseconds: 300),
      () => unawaited(load()),
    );
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    _requestId++;
    return super.close();
  }
}
