import 'package:json_annotation/json_annotation.dart';

import 'target_dto.dart';

part 'target_list_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
  checked: true,
)
class TargetListDto {
  const TargetListDto({required this.targets});

  factory TargetListDto.fromJson(Map<String, dynamic> json) =>
      _$TargetListDtoFromJson(json);

  @JsonKey(required: true, disallowNullValue: true)
  final List<TargetDto> targets;
}
