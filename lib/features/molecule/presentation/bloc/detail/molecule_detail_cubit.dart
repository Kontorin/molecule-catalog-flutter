import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/network/load_exception.dart';
import '../../../../mechanism/domain/i_mechanism_repository.dart';
import '../../../../mechanism/domain/mechanism_model.dart';
import '../../../domain/i_molecule_repository.dart';
import '../../../domain/molecule_model.dart';
import 'molecule_detail_state.dart';

class MoleculeDetailCubit extends Cubit<MoleculeDetailState> {
  MoleculeDetailCubit(this._repository, this._mechanismRepository)
    : super(const MoleculeDetailInitial());

  final IMoleculeRepository _repository;
  final IMechanismRepository _mechanismRepository;

  Future<void> load(String id) async {
    if (isClosed) return;
    emit(const MoleculeDetailInitial());

    try {
      final results = await Future.wait<Object?>([
        _repository.getMolecule(id),
        _mechanismRepository.getMechanismsForMolecule(id),
      ]);
      if (isClosed) return;

      final molecule = results[0] as MoleculeModel?;
      final mechanisms = results[1] as List<MechanismModel>;

      if (molecule == null) {
        emit(const MoleculeDetailNotFound());
        return;
      }

      emit(MoleculeDetailLoaded(molecule: molecule, mechanisms: mechanisms));
    } on LoadException catch (error) {
      if (isClosed) return;
      emit(MoleculeDetailFailure(error));
    }
  }
}
