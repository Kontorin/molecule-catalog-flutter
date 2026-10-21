import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../mechanism/domain/i_mechanism_repository.dart';
import '../../../domain/i_molecule_repository.dart';
import 'molecule_detail_state.dart';

class MoleculeDetailCubit extends Cubit<MoleculeDetailState> {
  MoleculeDetailCubit(this._repository, this._mechanismRepository)
    : super(const MoleculeDetailInitial());

  final IMoleculeRepository _repository;
  final IMechanismRepository _mechanismRepository;

  Future<void> load(String id) async {
    final molecule = await _repository.getMolecule(id);
    if (isClosed) return;

    if (molecule == null) {
      emit(const MoleculeDetailNotFound());
    } else {
      final mechanisms = await _mechanismRepository.getMechanismsForMolecule(
        molecule.id,
      );
      if (isClosed) return;

      emit(
        MoleculeDetailLoaded(
          molecule: molecule,
          mechanisms: mechanisms,
        ),
      );
    }
  }
}
