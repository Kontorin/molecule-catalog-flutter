import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/network/load_exception.dart';
import '../../../domain/i_molecule_repository.dart';
import '../../../domain/molecule_model.dart';
import 'molecule_list_state.dart';

class MoleculeListCubit extends Cubit<MoleculeListState> {
  MoleculeListCubit(this._repository)
    : super(MoleculeListState(molecules: [], query: ''));

  final IMoleculeRepository _repository;

  Future<void> load() async {
    if (isClosed) return;
    emit(state.copyWith(status: MoleculeListStatus.loading));

    try {
      final molecules = await _repository.getMolecules();
      if (isClosed) return;

      emit(
        state.copyWith(
          allMolecules: molecules,
          molecules: _filterMolecules(molecules, state.query),
          status: MoleculeListStatus.loaded,
        ),
      );
    } on LoadException catch (error) {
      if (isClosed) return;
      emit(state.copyWith(status: MoleculeListStatus.failure, error: error));
    }
  }

  void search(String query) {
    emit(
      state.copyWith(
        molecules: _filterMolecules(state.allMolecules, query),
        query: query,
      ),
    );
  }

  List<MoleculeModel> _filterMolecules(
    List<MoleculeModel> molecules,
    String query,
  ) {
    final normalizedQuery = query.trim().toLowerCase();
    final matches = <MoleculeModel>[];

    for (final molecule in molecules) {
      if (molecule.name.toLowerCase().contains(normalizedQuery)) {
        matches.add(molecule);
      }
    }

    return matches;
  }
}
