class MoleculeHierarchyModel {
  const MoleculeHierarchyModel({
    required this.activeId,
    required this.id,
    required this.parentId,
  });

  final String activeId;
  final String id;
  final String parentId;
}
