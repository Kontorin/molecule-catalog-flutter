// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'molecule_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoleculeListDto _$MoleculeListDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MoleculeListDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['molecules'],
        disallowNullValues: const ['molecules'],
      );
      final val = MoleculeListDto(
        molecules: $checkedConvert(
          'molecules',
          (v) => (v as List<dynamic>)
              .map((e) => MoleculeDto.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });
