// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TargetDto _$TargetDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TargetDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['target_chembl_id'],
        disallowNullValues: const ['target_chembl_id'],
      );
      final val = TargetDto(
        id: $checkedConvert('target_chembl_id', (v) => v as String),
        name: $checkedConvert('pref_name', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'id': 'target_chembl_id', 'name': 'pref_name'});
