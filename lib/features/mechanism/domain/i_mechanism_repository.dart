import 'mechanism_model.dart';

abstract interface class IMechanismRepository {
  Future<List<MechanismModel>> getMechanismsForMolecule(String moleculeId);

  Future<MechanismModel?> getMechanismForMolecule(
    String moleculeId,
    int mechanismId,
  );
}
