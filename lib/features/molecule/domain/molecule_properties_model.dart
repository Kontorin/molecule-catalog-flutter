class MoleculePropertiesModel {
  const MoleculePropertiesModel({
    required this.alogp,
    required this.aromaticRings,
    required this.formula,
    required this.molecularWeight,
    required this.hba,
    required this.hbd,
    required this.heavyAtoms,
    required this.freebaseMolecularWeight,
    required this.npLikenessScore,
    required this.numRo5Violations,
    required this.psa,
    required this.qedWeighted,
    required this.ro3Pass,
    required this.rtb,
  });

  final String alogp;
  final int aromaticRings;
  final String formula;
  final String molecularWeight;
  final int hba;
  final int hbd;
  final int heavyAtoms;
  final String freebaseMolecularWeight;
  final String npLikenessScore;
  final int numRo5Violations;
  final String psa;
  final String qedWeighted;
  final String ro3Pass;
  final int rtb;
}
