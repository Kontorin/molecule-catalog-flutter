import '../../../../molecule/domain/molecule_model.dart';
import '../../../domain/mechanism_model.dart';

sealed class MechanismDetailState {
  const MechanismDetailState();
}

final class MechanismDetailInitial extends MechanismDetailState {
  const MechanismDetailInitial();
}

final class MechanismDetailLoaded extends MechanismDetailState {
  const MechanismDetailLoaded({
    required this.mechanism,
    required this.molecule,
  });

  final MechanismModel mechanism;
  final MoleculeModel molecule;
}

final class MechanismDetailNotFound extends MechanismDetailState {
  const MechanismDetailNotFound();
}
