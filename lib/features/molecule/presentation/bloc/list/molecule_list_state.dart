import '../../../../../common/network/load_exception.dart';
import '../../../domain/molecule_model.dart';

enum MoleculeListStatus { loading, loaded, failure }

class MoleculeListState {
  MoleculeListState({
    required List<MoleculeModel> molecules,
    required this.query,
    List<MoleculeModel> allMolecules = const [],
    this.status = MoleculeListStatus.loading,
    this.error,
  }) : assert((status == MoleculeListStatus.failure) == (error != null)),
       molecules = List.unmodifiable(molecules),
       allMolecules = List.unmodifiable(allMolecules);

  final List<MoleculeModel> molecules;
  final String query;
  final List<MoleculeModel> allMolecules;
  final MoleculeListStatus status;
  final LoadException? error;

  MoleculeListState copyWith({
    List<MoleculeModel>? molecules,
    String? query,
    List<MoleculeModel>? allMolecules,
    MoleculeListStatus? status,
    LoadException? error,
  }) {
    final nextStatus = status ?? this.status;
    return MoleculeListState(
      molecules: molecules ?? this.molecules,
      query: query ?? this.query,
      allMolecules: allMolecules ?? this.allMolecules,
      status: nextStatus,
      error: nextStatus == MoleculeListStatus.failure
          ? error ?? this.error
          : null,
    );
  }
}
