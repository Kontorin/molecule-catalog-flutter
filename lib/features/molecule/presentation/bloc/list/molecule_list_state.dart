import '../../../../../common/network/load_exception.dart';
import '../../../domain/molecule_model.dart';

enum MoleculeListStatus { loading, loaded, failure }

class MoleculeListState {
  MoleculeListState({
    required List<MoleculeModel> molecules,
    required this.query,
    this.status = MoleculeListStatus.loading,
    this.error,
  }) : assert((status == MoleculeListStatus.failure) == (error != null)),
       molecules = List.unmodifiable(molecules);

  final List<MoleculeModel> molecules;
  final String query;
  final MoleculeListStatus status;
  final LoadException? error;

  MoleculeListState copyWith({
    List<MoleculeModel>? molecules,
    String? query,
    MoleculeListStatus? status,
    LoadException? error,
  }) {
    final nextStatus = status ?? this.status;
    return MoleculeListState(
      molecules: molecules ?? this.molecules,
      query: query ?? this.query,
      status: nextStatus,
      error: nextStatus == MoleculeListStatus.failure
          ? error ?? this.error
          : null,
    );
  }
}
