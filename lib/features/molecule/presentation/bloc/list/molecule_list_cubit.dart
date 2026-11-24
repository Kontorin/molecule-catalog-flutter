import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/network/load_exception.dart';
import '../../../domain/i_molecule_repository.dart';
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
      final molecules = await _repository.getMolecules(query: query);
      if (isClosed || requestId != _requestId) return;

      emit(
        MoleculeListState(
          query: query,
          molecules: molecules,
          status: MoleculeListStatus.loaded,
        ),
      );
    } on LoadException catch (error) {
      if (isClosed || requestId != _requestId) return;
      emit(state.copyWith(status: MoleculeListStatus.failure, error: error));
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
