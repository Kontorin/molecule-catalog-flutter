class MoleculeStructuresModel {
  const MoleculeStructuresModel({
    required this.canonicalSmiles,
    required this.molfile,
    required this.standardInchi,
    required this.standardInchiKey,
  });

  final String canonicalSmiles;
  final String molfile;
  final String standardInchi;
  final String standardInchiKey;
}
