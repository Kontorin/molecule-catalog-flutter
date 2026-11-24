// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'molecule_properties_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoleculePropertiesDto _$MoleculePropertiesDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MoleculePropertiesDto',
  json,
  ($checkedConvert) {
    final val = MoleculePropertiesDto(
      alogp: $checkedConvert('alogp', (v) => v as String?),
      aromaticRings: $checkedConvert(
        'aromatic_rings',
        (v) => (v as num?)?.toInt(),
      ),
      formula: $checkedConvert('full_molformula', (v) => v as String?),
      molecularWeight: $checkedConvert('full_mwt', (v) => v as String?),
      hba: $checkedConvert('hba', (v) => (v as num?)?.toInt()),
      hbd: $checkedConvert('hbd', (v) => (v as num?)?.toInt()),
      heavyAtoms: $checkedConvert('heavy_atoms', (v) => (v as num?)?.toInt()),
      freebaseMolecularWeight: $checkedConvert(
        'mw_freebase',
        (v) => v as String?,
      ),
      npLikenessScore: $checkedConvert(
        'np_likeness_score',
        (v) => v as String?,
      ),
      numRo5Violations: $checkedConvert(
        'num_ro5_violations',
        (v) => (v as num?)?.toInt(),
      ),
      psa: $checkedConvert('psa', (v) => v as String?),
      qedWeighted: $checkedConvert('qed_weighted', (v) => v as String?),
      ro3Pass: $checkedConvert('ro3_pass', (v) => v as String?),
      rtb: $checkedConvert('rtb', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'aromaticRings': 'aromatic_rings',
    'formula': 'full_molformula',
    'molecularWeight': 'full_mwt',
    'heavyAtoms': 'heavy_atoms',
    'freebaseMolecularWeight': 'mw_freebase',
    'npLikenessScore': 'np_likeness_score',
    'numRo5Violations': 'num_ro5_violations',
    'qedWeighted': 'qed_weighted',
    'ro3Pass': 'ro3_pass',
  },
);
