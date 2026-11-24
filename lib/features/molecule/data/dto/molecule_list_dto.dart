import 'package:json_annotation/json_annotation.dart';

import 'molecule_dto.dart';
import 'molecule_page_meta_dto.dart';

part 'molecule_list_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
  checked: true,
)
class MoleculeListDto {
  const MoleculeListDto({required this.molecules, required this.pageMeta});

  factory MoleculeListDto.fromJson(Map<String, dynamic> json) =>
      _$MoleculeListDtoFromJson(json);

  @JsonKey(required: true, disallowNullValue: true)
  final List<MoleculeDto> molecules;

  @JsonKey(name: 'page_meta', required: true, disallowNullValue: true)
  final MoleculePageMetaDto pageMeta;
}
