import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../mechanism/domain/i_mechanism_repository.dart';
import '../../../domain/i_molecule_repository.dart';
import 'molecule_mechanism_state.dart';

class MoleculeMechanismCubit extends Cubit<MoleculeMechanismState> {
  MoleculeMechanismCubit(this._mechanismRepository, this._moleculeRepository)
    : super(const MoleculeMechanismInitial());

  final IMechanismRepository _mechanismRepository;
  final IMoleculeRepository _moleculeRepository;

  Future<void> load(String moleculeId, String mechanismId) async {
    final id = int.tryParse(mechanismId);

    if (id == null) {
      emit(const MoleculeMechanismNotFound());
      return;
    }

    final mechanism = await _mechanismRepository.getMechanismForMolecule(
      moleculeId,
      id,
    );
    if (isClosed) return;

    final molecule = await _moleculeRepository.getMolecule(moleculeId);
    if (isClosed) return;

    if (mechanism == null || molecule == null) {
      emit(const MoleculeMechanismNotFound());
      return;
    }

    emit(MoleculeMechanismLoaded(mechanism: mechanism, molecule: molecule));
  }
}
