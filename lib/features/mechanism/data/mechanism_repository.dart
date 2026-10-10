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
  Future<MechanismModel?> getMechanism(int id) async {
    for (final mechanism in mockMechanisms) {
      if (mechanism.id == id) {
        return mechanism;
      }
    }

    return null;
  }
}
