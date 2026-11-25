// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'molecule_structures_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoleculeStructuresDto _$MoleculeStructuresDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MoleculeStructuresDto',
  json,
  ($checkedConvert) {
    final val = MoleculeStructuresDto(
      canonicalSmiles: $checkedConvert('canonical_smiles', (v) => v as String?),
      molfile: $checkedConvert('molfile', (v) => v as String?),
      standardInchi: $checkedConvert('standard_inchi', (v) => v as String?),
      standardInchiKey: $checkedConvert(
        'standard_inchi_key',
        (v) => v as String?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'canonicalSmiles': 'canonical_smiles',
    'standardInchi': 'standard_inchi',
    'standardInchiKey': 'standard_inchi_key',
  },
);
