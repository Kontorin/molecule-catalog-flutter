import '../../../../../common/network/load_exception.dart';
import '../../../../mechanism/domain/mechanism_model.dart';
import '../../../domain/molecule_model.dart';

sealed class MoleculeMechanismState {
  const MoleculeMechanismState();
}

final class MoleculeMechanismInitial extends MoleculeMechanismState {
  const MoleculeMechanismInitial();
}

final class MoleculeMechanismLoaded extends MoleculeMechanismState {
  const MoleculeMechanismLoaded({
    required this.mechanism,
    required this.molecule,
  });

  final MechanismModel mechanism;
  final MoleculeModel molecule;
}

final class MoleculeMechanismNotFound extends MoleculeMechanismState {
  const MoleculeMechanismNotFound();
}

final class MoleculeMechanismFailure extends MoleculeMechanismState {
  const MoleculeMechanismFailure(this.error);

  final LoadException error;
}
