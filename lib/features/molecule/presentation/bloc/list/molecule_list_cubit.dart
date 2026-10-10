import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/i_molecule_repository.dart';
import '../../../domain/molecule_model.dart';
import 'molecule_list_state.dart';

class MoleculeListCubit extends Cubit<MoleculeListState> {
  MoleculeListCubit(this._repository)
    : super(MoleculeListState(molecules: [], query: ''));

  final IMoleculeRepository _repository;

  Future<void> load() async {
    final molecules = await _repository.getMolecules();
    if (isClosed) return;

    emit(state.copyWith(allMolecules: molecules));
    search(state.query);
  }

  void search(String query) {
    final normalizedQuery = query.trim().toLowerCase();
    final matches = <MoleculeModel>[];

    for (final molecule in state.allMolecules) {
      if (molecule.name.toLowerCase().contains(normalizedQuery)) {
        matches.add(molecule);
      }
    }

    emit(state.copyWith(molecules: matches, query: query));
  }
}
