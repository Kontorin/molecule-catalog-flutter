import '../dto/mechanism_dto.dart';
import '../dto/target_dto.dart';

abstract interface class IMechanismDataSource {
  Future<List<MechanismDto>> getMechanismsForMolecule(String moleculeId);

  Future<MechanismDto> getMechanism(int id);

  Future<List<TargetDto>> getTargets(List<String> ids);
}
