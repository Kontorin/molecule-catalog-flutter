import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/network/load_exception.dart';
import '../../../../mechanism/domain/i_mechanism_repository.dart';
import '../../../../mechanism/domain/mechanism_model.dart';
import '../../../domain/i_molecule_repository.dart';
import '../../../domain/molecule_model.dart';
import 'molecule_mechanism_state.dart';

class MoleculeMechanismCubit extends Cubit<MoleculeMechanismState> {
  MoleculeMechanismCubit(this._mechanismRepository, this._moleculeRepository)
    : super(const MoleculeMechanismInitial());

  final IMechanismRepository _mechanismRepository;
  final IMoleculeRepository _moleculeRepository;

  Future<void> load(String moleculeId, String mechanismId) async {
    if (isClosed) return;
    emit(const MoleculeMechanismInitial());
    final id = int.tryParse(mechanismId);

    if (id == null) {
      emit(const MoleculeMechanismNotFound());
      return;
    }

    try {
      final results = await Future.wait<Object?>([
        _mechanismRepository.getMechanismForMolecule(moleculeId, id),
        _moleculeRepository.getMolecule(moleculeId),
      ]);
      if (isClosed) return;

      final mechanism = results[0] as MechanismModel?;
      final molecule = results[1] as MoleculeModel?;

      if (mechanism == null || molecule == null) {
        emit(const MoleculeMechanismNotFound());
        return;
      }

      emit(MoleculeMechanismLoaded(mechanism: mechanism, molecule: molecule));
    } on LoadException catch (error) {
      if (isClosed) return;
      emit(MoleculeMechanismFailure(error));
    }
  }
}
