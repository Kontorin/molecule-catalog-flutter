import 'molecule_model.dart';

class MoleculePageModel {
  MoleculePageModel({
    required List<MoleculeModel> molecules,
    required this.totalCount,
    required this.nextOffset,
  }) : molecules = List.unmodifiable(molecules);

  final List<MoleculeModel> molecules;
  final int totalCount;
  final int? nextOffset;
}
