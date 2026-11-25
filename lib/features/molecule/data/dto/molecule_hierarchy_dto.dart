import 'package:json_annotation/json_annotation.dart';

part 'molecule_hierarchy_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
  checked: true,
)
class MoleculeHierarchyDto {
  const MoleculeHierarchyDto({this.activeId, this.id, this.parentId});

  factory MoleculeHierarchyDto.fromJson(Map<String, dynamic> json) =>
      _$MoleculeHierarchyDtoFromJson(json);

  @JsonKey(name: 'active_chembl_id')
  final String? activeId;

  @JsonKey(name: 'molecule_chembl_id')
  final String? id;

  @JsonKey(name: 'parent_chembl_id')
  final String? parentId;
}
