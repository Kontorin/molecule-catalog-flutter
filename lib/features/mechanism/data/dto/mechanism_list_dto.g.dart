// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mechanism_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MechanismListDto _$MechanismListDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MechanismListDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['mechanisms', 'page_meta'],
        disallowNullValues: const ['mechanisms', 'page_meta'],
      );
      final val = MechanismListDto(
        mechanisms: $checkedConvert(
          'mechanisms',
          (v) => (v as List<dynamic>)
              .map((e) => MechanismDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        pageMeta: $checkedConvert(
          'page_meta',
          (v) => MechanismPageMetaDto.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'pageMeta': 'page_meta'});
