import 'package:json_annotation/json_annotation.dart';

import 'molecule_hierarchy_dto.dart';
import 'molecule_properties_dto.dart';
import 'molecule_structures_dto.dart';

part 'molecule_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
  checked: true,
)
class MoleculeDto {
  const MoleculeDto({
    this.atcClassifications,
    this.availabilityType,
    this.biotherapeutic,
    this.blackBoxWarning,
    this.chemicalProbe,
    this.chirality,
    this.crossReferences,
    this.dosedIngredient,
    this.firstApproval,
    this.firstInClass,
    this.helmNotation,
    this.inorganicFlag,
    this.maxPhase,
    required this.id,
    this.hierarchy,
    this.properties,
    this.structures,
    this.synonyms,
    this.type,
    this.naturalProduct,
    this.oral,
    this.orphan,
    this.parenteral,
    this.polymerFlag,
    this.name,
    this.prodrug,
    this.structureType,
    this.therapeuticFlag,
    this.topical,
    this.usanStem,
    this.usanStemDefinition,
    this.usanSubstem,
    this.usanYear,
    this.veterinary,
    this.withdrawnFlag,
  });

  factory MoleculeDto.fromJson(Map<String, dynamic> json) =>
      _$MoleculeDtoFromJson(json);

  final List<Object>? atcClassifications;

  final int? availabilityType;

  final Object? biotherapeutic;

  final int? blackBoxWarning;

  final int? chemicalProbe;

  final int? chirality;

  final List<Object>? crossReferences;

  final bool? dosedIngredient;

  final Object? firstApproval;

  final int? firstInClass;

  final Object? helmNotation;

  final int? inorganicFlag;

  final Object? maxPhase;

  @JsonKey(name: 'molecule_chembl_id', required: true, disallowNullValue: true)
  final String id;

  @JsonKey(name: 'molecule_hierarchy')
  final MoleculeHierarchyDto? hierarchy;

  @JsonKey(name: 'molecule_properties')
  final MoleculePropertiesDto? properties;

  @JsonKey(name: 'molecule_structures')
  final MoleculeStructuresDto? structures;

  @JsonKey(name: 'molecule_synonyms')
  final List<Object>? synonyms;

  @JsonKey(name: 'molecule_type')
  final String? type;

  final int? naturalProduct;

  final bool? oral;

  final int? orphan;

  final bool? parenteral;

  final int? polymerFlag;

  @JsonKey(name: 'pref_name')
  final String? name;

  final int? prodrug;

  final String? structureType;

  final bool? therapeuticFlag;

  final bool? topical;

  final Object? usanStem;

  final Object? usanStemDefinition;

  final Object? usanSubstem;

  final Object? usanYear;

  final int? veterinary;

  final bool? withdrawnFlag;
}
