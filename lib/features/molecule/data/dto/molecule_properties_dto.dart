import 'package:json_annotation/json_annotation.dart';

part 'molecule_properties_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
  checked: true,
)
class MoleculePropertiesDto {
  const MoleculePropertiesDto({
    this.alogp,
    this.aromaticRings,
    this.formula,
    this.molecularWeight,
    this.hba,
    this.hbd,
    this.heavyAtoms,
    this.freebaseMolecularWeight,
    this.npLikenessScore,
    this.numRo5Violations,
    this.psa,
    this.qedWeighted,
    this.ro3Pass,
    this.rtb,
  });

  factory MoleculePropertiesDto.fromJson(Map<String, dynamic> json) =>
      _$MoleculePropertiesDtoFromJson(json);

  final String? alogp;

  final int? aromaticRings;

  @JsonKey(name: 'full_molformula')
  final String? formula;

  @JsonKey(name: 'full_mwt')
  final String? molecularWeight;

  final int? hba;

  final int? hbd;

  final int? heavyAtoms;

  @JsonKey(name: 'mw_freebase')
  final String? freebaseMolecularWeight;

  final String? npLikenessScore;

  final int? numRo5Violations;

  final String? psa;

  final String? qedWeighted;

  final String? ro3Pass;

  final int? rtb;
}
