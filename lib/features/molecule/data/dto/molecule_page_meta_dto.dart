import 'package:json_annotation/json_annotation.dart';

part 'molecule_page_meta_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
  checked: true,
)
class MoleculePageMetaDto {
  const MoleculePageMetaDto({
    required this.limit,
    required this.offset,
    required this.totalCount,
    required this.next,
  });

  factory MoleculePageMetaDto.fromJson(Map<String, dynamic> json) =>
      _$MoleculePageMetaDtoFromJson(json);

  @JsonKey(required: true, disallowNullValue: true)
  final int limit;

  @JsonKey(required: true, disallowNullValue: true)
  final int offset;

  @JsonKey(required: true, disallowNullValue: true)
  final int totalCount;

  @JsonKey(required: true)
  final String? next;
}
