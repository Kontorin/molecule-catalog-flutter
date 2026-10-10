import '../../../domain/molecule_model.dart';

class MoleculeListState {
  MoleculeListState({
    required List<MoleculeModel> molecules,
    required this.query,
    List<MoleculeModel> allMolecules = const [],
  }) : molecules = List.unmodifiable(molecules),
       allMolecules = List.unmodifiable(allMolecules);

  final List<MoleculeModel> molecules;
  final String query;
  final List<MoleculeModel> allMolecules;

  MoleculeListState copyWith({
    List<MoleculeModel>? molecules,
    String? query,
    List<MoleculeModel>? allMolecules,
  }) {
    return MoleculeListState(
      molecules: molecules ?? this.molecules,
      query: query ?? this.query,
      allMolecules: allMolecules ?? this.allMolecules,
    );
  }
}
