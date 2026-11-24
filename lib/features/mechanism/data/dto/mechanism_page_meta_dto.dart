import 'package:json_annotation/json_annotation.dart';

part 'mechanism_page_meta_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
  checked: true,
)
class MechanismPageMetaDto {
  const MechanismPageMetaDto({
    required this.limit,
    required this.offset,
    this.next,
  });

  factory MechanismPageMetaDto.fromJson(Map<String, dynamic> json) =>
      _$MechanismPageMetaDtoFromJson(json);

  @JsonKey(required: true, disallowNullValue: true)
  final int limit;

  @JsonKey(required: true, disallowNullValue: true)
  final int offset;

  final String? next;
}
