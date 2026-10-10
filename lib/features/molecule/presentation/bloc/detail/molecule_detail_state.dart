import '../../../../mechanism/domain/mechanism_model.dart';
import '../../../domain/molecule_model.dart';

sealed class MoleculeDetailState {
  const MoleculeDetailState();
}

final class MoleculeDetailInitial extends MoleculeDetailState {
  const MoleculeDetailInitial();
}

final class MoleculeDetailLoaded extends MoleculeDetailState {
  MoleculeDetailLoaded({
    required this.molecule,
    required List<MechanismModel> mechanisms,
  }) : mechanisms = List.unmodifiable(mechanisms);

  final MoleculeModel molecule;
  final List<MechanismModel> mechanisms;
}

final class MoleculeDetailNotFound extends MoleculeDetailState {
  const MoleculeDetailNotFound();
}
