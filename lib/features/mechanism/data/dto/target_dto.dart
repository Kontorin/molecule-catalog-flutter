import 'package:json_annotation/json_annotation.dart';

part 'target_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
  checked: true,
)
class TargetDto {
  const TargetDto({required this.id, this.name});

  factory TargetDto.fromJson(Map<String, dynamic> json) =>
      _$TargetDtoFromJson(json);

  @JsonKey(name: 'target_chembl_id', required: true, disallowNullValue: true)
  final String id;

  @JsonKey(name: 'pref_name')
  final String? name;
}
