import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../molecule/domain/i_molecule_repository.dart';
import '../../../domain/i_mechanism_repository.dart';
import 'mechanism_detail_state.dart';

class MechanismDetailCubit extends Cubit<MechanismDetailState> {
  MechanismDetailCubit(this._mechanismRepository, this._moleculeRepository)
    : super(const MechanismDetailInitial());

  final IMechanismRepository _mechanismRepository;
  final IMoleculeRepository _moleculeRepository;

  Future<void> load(String moleculeId, String mechanismId) async {
    final id = int.tryParse(mechanismId);

    if (id == null) {
      emit(const MechanismDetailNotFound());
      return;
    }

    final mechanism = await _mechanismRepository.getMechanism(id);
    if (isClosed) return;

    final molecule = await _moleculeRepository.getMolecule(moleculeId);
    if (isClosed) return;

    if (mechanism == null || molecule == null) {
      emit(const MechanismDetailNotFound());
      return;
    }

    if (mechanism.moleculeId != moleculeId &&
        mechanism.parentMoleculeId != moleculeId) {
      emit(const MechanismDetailNotFound());
      return;
    }

    emit(MechanismDetailLoaded(mechanism: mechanism, molecule: molecule));
  }
}
