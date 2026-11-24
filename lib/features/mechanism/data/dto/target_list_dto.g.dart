// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TargetListDto _$TargetListDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TargetListDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['targets'],
        disallowNullValues: const ['targets'],
      );
      final val = TargetListDto(
        targets: $checkedConvert(
          'targets',
          (v) => (v as List<dynamic>)
              .map((e) => TargetDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });
