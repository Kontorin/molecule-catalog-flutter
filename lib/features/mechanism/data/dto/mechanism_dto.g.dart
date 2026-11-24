// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mechanism_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MechanismDto _$MechanismDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MechanismDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['mec_id', 'molecule_chembl_id'],
          disallowNullValues: const ['mec_id', 'molecule_chembl_id'],
        );
        final val = MechanismDto(
          id: $checkedConvert('mec_id', (v) => (v as num).toInt()),
          moleculeId: $checkedConvert('molecule_chembl_id', (v) => v as String),
          parentMoleculeId: $checkedConvert(
            'parent_molecule_chembl_id',
            (v) => v as String?,
          ),
          description: $checkedConvert(
            'mechanism_of_action',
            (v) => v as String?,
          ),
          actionType: $checkedConvert('action_type', (v) => v as String?),
          targetId: $checkedConvert('target_chembl_id', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'id': 'mec_id',
        'moleculeId': 'molecule_chembl_id',
        'parentMoleculeId': 'parent_molecule_chembl_id',
        'description': 'mechanism_of_action',
        'actionType': 'action_type',
        'targetId': 'target_chembl_id',
      },
    );
