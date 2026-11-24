// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'molecule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoleculeDto _$MoleculeDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MoleculeDto',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['molecule_chembl_id'],
      disallowNullValues: const ['molecule_chembl_id'],
    );
    final val = MoleculeDto(
      atcClassifications: $checkedConvert(
        'atc_classifications',
        (v) => (v as List<dynamic>?)?.map((e) => e as Object).toList(),
      ),
      availabilityType: $checkedConvert(
        'availability_type',
        (v) => (v as num?)?.toInt(),
      ),
      biotherapeutic: $checkedConvert('biotherapeutic', (v) => v),
      blackBoxWarning: $checkedConvert(
        'black_box_warning',
        (v) => (v as num?)?.toInt(),
      ),
      chemicalProbe: $checkedConvert(
        'chemical_probe',
        (v) => (v as num?)?.toInt(),
      ),
      chirality: $checkedConvert('chirality', (v) => (v as num?)?.toInt()),
      crossReferences: $checkedConvert(
        'cross_references',
        (v) => (v as List<dynamic>?)?.map((e) => e as Object).toList(),
      ),
      dosedIngredient: $checkedConvert('dosed_ingredient', (v) => v as bool?),
      firstApproval: $checkedConvert('first_approval', (v) => v),
      firstInClass: $checkedConvert(
        'first_in_class',
        (v) => (v as num?)?.toInt(),
      ),
      helmNotation: $checkedConvert('helm_notation', (v) => v),
      inorganicFlag: $checkedConvert(
        'inorganic_flag',
        (v) => (v as num?)?.toInt(),
      ),
      maxPhase: $checkedConvert('max_phase', (v) => v),
      id: $checkedConvert('molecule_chembl_id', (v) => v as String),
      hierarchy: $checkedConvert(
        'molecule_hierarchy',
        (v) => v == null
            ? null
            : MoleculeHierarchyDto.fromJson(v as Map<String, dynamic>),
      ),
      properties: $checkedConvert(
        'molecule_properties',
        (v) => v == null
            ? null
            : MoleculePropertiesDto.fromJson(v as Map<String, dynamic>),
      ),
      structures: $checkedConvert(
        'molecule_structures',
        (v) => v == null
            ? null
            : MoleculeStructuresDto.fromJson(v as Map<String, dynamic>),
      ),
      synonyms: $checkedConvert(
        'molecule_synonyms',
        (v) => (v as List<dynamic>?)?.map((e) => e as Object).toList(),
      ),
      type: $checkedConvert('molecule_type', (v) => v as String?),
      naturalProduct: $checkedConvert(
        'natural_product',
        (v) => (v as num?)?.toInt(),
      ),
      oral: $checkedConvert('oral', (v) => v as bool?),
      orphan: $checkedConvert('orphan', (v) => (v as num?)?.toInt()),
      parenteral: $checkedConvert('parenteral', (v) => v as bool?),
      polymerFlag: $checkedConvert('polymer_flag', (v) => (v as num?)?.toInt()),
      name: $checkedConvert('pref_name', (v) => v as String?),
      prodrug: $checkedConvert('prodrug', (v) => (v as num?)?.toInt()),
      structureType: $checkedConvert('structure_type', (v) => v as String?),
      therapeuticFlag: $checkedConvert('therapeutic_flag', (v) => v as bool?),
      topical: $checkedConvert('topical', (v) => v as bool?),
      usanStem: $checkedConvert('usan_stem', (v) => v),
      usanStemDefinition: $checkedConvert('usan_stem_definition', (v) => v),
      usanSubstem: $checkedConvert('usan_substem', (v) => v),
      usanYear: $checkedConvert('usan_year', (v) => v),
      veterinary: $checkedConvert('veterinary', (v) => (v as num?)?.toInt()),
      withdrawnFlag: $checkedConvert('withdrawn_flag', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'atcClassifications': 'atc_classifications',
    'availabilityType': 'availability_type',
    'blackBoxWarning': 'black_box_warning',
    'chemicalProbe': 'chemical_probe',
    'crossReferences': 'cross_references',
    'dosedIngredient': 'dosed_ingredient',
    'firstApproval': 'first_approval',
    'firstInClass': 'first_in_class',
    'helmNotation': 'helm_notation',
    'inorganicFlag': 'inorganic_flag',
    'maxPhase': 'max_phase',
    'id': 'molecule_chembl_id',
    'hierarchy': 'molecule_hierarchy',
    'properties': 'molecule_properties',
    'structures': 'molecule_structures',
    'synonyms': 'molecule_synonyms',
    'type': 'molecule_type',
    'naturalProduct': 'natural_product',
    'polymerFlag': 'polymer_flag',
    'name': 'pref_name',
    'structureType': 'structure_type',
    'therapeuticFlag': 'therapeutic_flag',
    'usanStem': 'usan_stem',
    'usanStemDefinition': 'usan_stem_definition',
    'usanSubstem': 'usan_substem',
    'usanYear': 'usan_year',
    'withdrawnFlag': 'withdrawn_flag',
  },
);
