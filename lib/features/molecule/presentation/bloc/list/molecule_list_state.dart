import '../../../../../common/network/load_exception.dart';
import '../../../domain/molecule_model.dart';

enum MoleculeListStatus {
  loading,
  loaded,
  failure,
  loadingMore,
  loadMoreFailure,
}

class MoleculeListState {
  MoleculeListState({
    required List<MoleculeModel> molecules,
    required this.query,
    this.totalCount = 0,
    this.nextOffset,
    this.status = MoleculeListStatus.loading,
    this.error,
  }) : assert(
         (status == MoleculeListStatus.failure ||
                 status == MoleculeListStatus.loadMoreFailure) ==
             (error != null),
       ),
       molecules = List.unmodifiable(molecules);

  final List<MoleculeModel> molecules;
  final String query;
  final int totalCount;
  final int? nextOffset;
  final MoleculeListStatus status;
  final LoadException? error;

  bool get hasLoadedPage => switch (status) {
    MoleculeListStatus.loaded ||
    MoleculeListStatus.loadingMore ||
    MoleculeListStatus.loadMoreFailure => true,
    _ => false,
  };

  MoleculeListState copyWith({
    MoleculeListStatus? status,
    LoadException? error,
  }) {
    final nextStatus = status ?? this.status;
    return MoleculeListState(
      molecules: molecules,
      query: query,
      totalCount: totalCount,
      nextOffset: nextOffset,
      status: nextStatus,
      error:
          nextStatus == MoleculeListStatus.failure ||
              nextStatus == MoleculeListStatus.loadMoreFailure
          ? error ?? this.error
          : null,
    );
  }
}
