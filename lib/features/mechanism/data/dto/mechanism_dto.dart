import 'package:json_annotation/json_annotation.dart';

part 'mechanism_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
  checked: true,
)
class MechanismDto {
  const MechanismDto({
    required this.id,
    required this.moleculeId,
    this.parentMoleculeId,
    this.description,
    this.actionType,
    this.targetId,
  });

  factory MechanismDto.fromJson(Map<String, dynamic> json) =>
      _$MechanismDtoFromJson(json);

  @JsonKey(name: 'mec_id', required: true, disallowNullValue: true)
  final int id;

  @JsonKey(name: 'molecule_chembl_id', required: true, disallowNullValue: true)
  final String moleculeId;

  @JsonKey(name: 'parent_molecule_chembl_id')
  final String? parentMoleculeId;

  @JsonKey(name: 'mechanism_of_action')
  final String? description;

  final String? actionType;

  @JsonKey(name: 'target_chembl_id')
  final String? targetId;
}
