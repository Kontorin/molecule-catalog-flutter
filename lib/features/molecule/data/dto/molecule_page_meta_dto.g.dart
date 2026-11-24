// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'molecule_page_meta_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoleculePageMetaDto _$MoleculePageMetaDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MoleculePageMetaDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['limit', 'offset', 'total_count', 'next'],
        disallowNullValues: const ['limit', 'offset', 'total_count'],
      );
      final val = MoleculePageMetaDto(
        limit: $checkedConvert('limit', (v) => (v as num).toInt()),
        offset: $checkedConvert('offset', (v) => (v as num).toInt()),
        totalCount: $checkedConvert('total_count', (v) => (v as num).toInt()),
        next: $checkedConvert('next', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'totalCount': 'total_count'});
