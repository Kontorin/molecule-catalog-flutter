import '../domain/i_mechanism_repository.dart';
import '../domain/mechanism_model.dart';
import 'mock_mechanisms.dart';

class MechanismRepository implements IMechanismRepository {
  @override
  Future<List<MechanismModel>> getMechanismsForMolecule(String moleculeId) async {
    final matches = <MechanismModel>[];

    for (final mechanism in mockMechanisms) {
      if (mechanism.moleculeId == moleculeId ||
          mechanism.parentMoleculeId == moleculeId) {
        matches.add(mechanism);
      }
    }

    return List.unmodifiable(matches);
  }

  @override
  Future<MechanismModel?> getMechanismForMolecule(
    String moleculeId,
    int mechanismId,
  ) async {
    final mechanisms = await getMechanismsForMolecule(moleculeId);

    for (final mechanism in mechanisms) {
      if (mechanism.id == mechanismId) {
        return mechanism;
      }
    }

    return null;
  }
}
