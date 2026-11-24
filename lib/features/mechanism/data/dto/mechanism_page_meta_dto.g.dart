// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mechanism_page_meta_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MechanismPageMetaDto _$MechanismPageMetaDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MechanismPageMetaDto', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const ['limit', 'offset'],
    disallowNullValues: const ['limit', 'offset'],
  );
  final val = MechanismPageMetaDto(
    limit: $checkedConvert('limit', (v) => (v as num).toInt()),
    offset: $checkedConvert('offset', (v) => (v as num).toInt()),
    next: $checkedConvert('next', (v) => v as String?),
  );
  return val;
});
