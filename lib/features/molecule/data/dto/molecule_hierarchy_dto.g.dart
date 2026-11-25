// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'molecule_hierarchy_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoleculeHierarchyDto _$MoleculeHierarchyDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MoleculeHierarchyDto',
  json,
  ($checkedConvert) {
    final val = MoleculeHierarchyDto(
      activeId: $checkedConvert('active_chembl_id', (v) => v as String?),
      id: $checkedConvert('molecule_chembl_id', (v) => v as String?),
      parentId: $checkedConvert('parent_chembl_id', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'activeId': 'active_chembl_id',
    'id': 'molecule_chembl_id',
    'parentId': 'parent_chembl_id',
  },
);
