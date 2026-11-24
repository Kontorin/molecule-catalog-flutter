import '../../domain/mechanism_model.dart';
import '../dto/mechanism_dto.dart';
import '../dto/target_dto.dart';

extension MechanismDtoMapper on MechanismDto {
  MechanismModel toModel({TargetDto? target}) {
    final targetName = target?.name?.trim();
    return MechanismModel(
      id: id,
      moleculeId: moleculeId,
      parentMoleculeId: parentMoleculeId ?? '',
      description: description ?? '',
      actionType: actionType ?? '',
      targetId: targetId ?? '',
      targetName: targetName == null || targetName.isEmpty
          ? targetId ?? ''
          : targetName,
    );
  }
}
