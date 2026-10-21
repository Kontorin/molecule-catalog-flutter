class MechanismModel {
  const MechanismModel({
    required this.id,
    required this.moleculeId,
    required this.parentMoleculeId,
    required this.description,
    required this.actionType,
    required this.targetId,
    required this.targetName,
  });

  final int id;
  final String moleculeId;
  final String parentMoleculeId;
  final String description;
  final String actionType;
  final String targetId;
  final String targetName;
}
