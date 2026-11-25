// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'molecule_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoleculeListDto _$MoleculeListDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MoleculeListDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['molecules', 'page_meta'],
        disallowNullValues: const ['molecules', 'page_meta'],
      );
      final val = MoleculeListDto(
        molecules: $checkedConvert(
          'molecules',
          (v) => (v as List<dynamic>)
              .map((e) => MoleculeDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        pageMeta: $checkedConvert(
          'page_meta',
          (v) => MoleculePageMetaDto.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'pageMeta': 'page_meta'});
