import 'molecule_hierarchy_model.dart';
import 'molecule_properties_model.dart';
import 'molecule_structures_model.dart';

class MoleculeModel {
  const MoleculeModel({
    required this.atcClassifications,
    required this.availabilityType,
    required this.biotherapeutic,
    required this.blackBoxWarning,
    required this.chemicalProbe,
    required this.chirality,
    required this.crossReferences,
    required this.dosedIngredient,
    required this.firstApproval,
    required this.firstInClass,
    required this.helmNotation,
    required this.inorganicFlag,
    required this.maxPhase,
    required this.id,
    required this.hierarchy,
    required this.properties,
    required this.structures,
    required this.synonyms,
    required this.type,
    required this.naturalProduct,
    required this.oral,
    required this.orphan,
    required this.parenteral,
    required this.polymerFlag,
    required this.name,
    required this.prodrug,
    required this.structureType,
    required this.therapeuticFlag,
    required this.topical,
    required this.usanStem,
    required this.usanStemDefinition,
    required this.usanSubstem,
    required this.usanYear,
    required this.veterinary,
    required this.withdrawnFlag,
  });

  final List<Object> atcClassifications;
  final int availabilityType;
  final Object biotherapeutic;
  final int blackBoxWarning;
  final int chemicalProbe;
  final int chirality;
  final List<Object> crossReferences;
  final bool dosedIngredient;
  final Object firstApproval;
  final int firstInClass;
  final Object helmNotation;
  final int inorganicFlag;
  final Object maxPhase;
  final String id;
  final MoleculeHierarchyModel hierarchy;
  final MoleculePropertiesModel properties;
  final MoleculeStructuresModel structures;
  final List<Object> synonyms;
  final String type;
  final int naturalProduct;
  final bool oral;
  final int orphan;
  final bool parenteral;
  final int polymerFlag;
  final String name;
  final int prodrug;
  final String structureType;
  final bool therapeuticFlag;
  final bool topical;
  final Object usanStem;
  final Object usanStemDefinition;
  final Object usanSubstem;
  final Object usanYear;
  final int veterinary;
  final bool withdrawnFlag;
}
