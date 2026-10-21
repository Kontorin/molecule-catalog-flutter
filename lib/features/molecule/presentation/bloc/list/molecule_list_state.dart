import '../../../domain/molecule_model.dart';

enum MoleculeListStatus { loading, loaded }

class MoleculeListState {
  MoleculeListState({
    required List<MoleculeModel> molecules,
    required this.query,
    List<MoleculeModel> allMolecules = const [],
    this.status = MoleculeListStatus.loading,
  }) : molecules = List.unmodifiable(molecules),
       allMolecules = List.unmodifiable(allMolecules);

  final List<MoleculeModel> molecules;
  final String query;
  final List<MoleculeModel> allMolecules;
  final MoleculeListStatus status;

  MoleculeListState copyWith({
    List<MoleculeModel>? molecules,
    String? query,
    List<MoleculeModel>? allMolecules,
    MoleculeListStatus? status,
  }) {
    return MoleculeListState(
      molecules: molecules ?? this.molecules,
      query: query ?? this.query,
      allMolecules: allMolecules ?? this.allMolecules,
      status: status ?? this.status,
    );
  }
}
