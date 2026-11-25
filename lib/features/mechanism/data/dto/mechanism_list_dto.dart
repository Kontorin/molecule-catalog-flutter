import 'package:json_annotation/json_annotation.dart';

import 'mechanism_dto.dart';
import 'mechanism_page_meta_dto.dart';

part 'mechanism_list_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
  checked: true,
)
class MechanismListDto {
  const MechanismListDto({required this.mechanisms, required this.pageMeta});

  factory MechanismListDto.fromJson(Map<String, dynamic> json) =>
      _$MechanismListDtoFromJson(json);

  @JsonKey(required: true, disallowNullValue: true)
  final List<MechanismDto> mechanisms;

  @JsonKey(name: 'page_meta', required: true, disallowNullValue: true)
  final MechanismPageMetaDto pageMeta;
}
