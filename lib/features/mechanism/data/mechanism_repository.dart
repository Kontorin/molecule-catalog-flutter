import '../../../common/network/load_exception.dart';
import '../domain/i_mechanism_repository.dart';
import '../domain/mechanism_model.dart';
import 'data_sources/i_mechanism_data_source.dart';
import 'dto/mechanism_dto.dart';
import 'dto/target_dto.dart';
import 'mappers/mechanism_mapper.dart';

class MechanismRepository implements IMechanismRepository {
  MechanismRepository(this._dataSource);

  final IMechanismDataSource _dataSource;

  @override
  Future<List<MechanismModel>> getMechanismsForMolecule(
    String moleculeId,
  ) async {
    final mechanisms = await _dataSource.getMechanismsForMolecule(moleculeId);
    final targetIds = mechanisms
        .map((mechanism) => mechanism.targetId)
        .whereType<String>()
        .toSet()
        .toList();
    final targets = await _dataSource.getTargets(targetIds);
    final targetsById = <String, TargetDto>{
      for (final target in targets) target.id: target,
    };

    return List.unmodifiable(
      mechanisms.map(
        (mechanism) =>
            mechanism.toModel(target: targetsById[mechanism.targetId]),
      ),
    );
  }

  @override
  Future<MechanismModel?> getMechanismForMolecule(
    String moleculeId,
    int mechanismId,
  ) async {
    final MechanismDto mechanism;
    try {
      mechanism = await _dataSource.getMechanism(mechanismId);
    } on NotFoundLoadException {
      return null;
    }

    if (mechanism.moleculeId != moleculeId &&
        mechanism.parentMoleculeId != moleculeId) {
      return null;
    }

    final targetId = mechanism.targetId;
    final targets = await _dataSource.getTargets(
      targetId == null ? const [] : [targetId],
    );
    return mechanism.toModel(target: targets.firstOrNull);
  }
}
