import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/i_molecule_repository.dart';
import '../../../domain/molecule_model.dart';
import 'molecule_list_state.dart';

class MoleculeListCubit extends Cubit<MoleculeListState> {
  MoleculeListCubit(this._repository)
    : super(MoleculeListState(molecules: [], query: ''));

  final IMoleculeRepository _repository;

  Future<void> load() async {
    emit(state.copyWith(status: MoleculeListStatus.loading));

    final molecules = await _repository.getMolecules();
    if (isClosed) return;

    emit(
      state.copyWith(
        allMolecules: molecules,
        molecules: _filterMolecules(molecules, state.query),
        status: MoleculeListStatus.loaded,
      ),
    );
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
