import 'package:json_annotation/json_annotation.dart';

part 'molecule_structures_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
  checked: true,
)
class MoleculeStructuresDto {
  const MoleculeStructuresDto({
    this.canonicalSmiles,
    this.molfile,
    this.standardInchi,
    this.standardInchiKey,
  });

  factory MoleculeStructuresDto.fromJson(Map<String, dynamic> json) =>
      _$MoleculeStructuresDtoFromJson(json);

  final String? canonicalSmiles;

  final String? molfile;

  final String? standardInchi;

  final String? standardInchiKey;
}
