import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../common/network/load_exception.dart';
import '../api/mechanism_api.dart';
import '../dto/mechanism_dto.dart';
import '../dto/target_dto.dart';
import 'i_mechanism_data_source.dart';

class NetworkMechanismDataSource implements IMechanismDataSource {
  NetworkMechanismDataSource(this._api);

  final MechanismApi _api;

  @override
  Future<List<MechanismDto>> getMechanismsForMolecule(String moleculeId) async {
    final responses = await _load(
      () => Future.wait([
        _getAllMechanisms(moleculeId: moleculeId),
        _getAllMechanisms(parentMoleculeId: moleculeId),
      ]),
    );
    final byId = <int, MechanismDto>{};
    for (final mechanisms in responses) {
      for (final mechanism in mechanisms) {
        byId[mechanism.id] = mechanism;
      }
    }

    final mechanisms = byId.values.toList()
      ..sort((first, second) => first.id.compareTo(second.id));
    return List.unmodifiable(mechanisms);
  }

  Future<List<MechanismDto>> _getAllMechanisms({
    String? moleculeId,
    String? parentMoleculeId,
  }) async {
    final mechanisms = <MechanismDto>[];
    var offset = 0;
    while (true) {
      final response = await _api.getMechanisms(
        moleculeId: moleculeId,
        parentMoleculeId: parentMoleculeId,
        offset: offset,
      );
      mechanisms.addAll(response.mechanisms);
      final page = response.pageMeta;
      if (page.next == null) return mechanisms;

      final nextOffset = page.offset + page.limit;
      if (page.limit <= 0 || nextOffset <= offset) {
        throw const FormatException('Invalid mechanism pagination');
      }
      offset = nextOffset;
    }
  }

  @override
  Future<MechanismDto> getMechanism(int id) {
    return _load(() => _api.getMechanism(id));
  }

  @override
  Future<List<TargetDto>> getTargets(List<String> ids) async {
    final uniqueIds = ids.where((id) => id.isNotEmpty).toSet().toList();
    if (uniqueIds.isEmpty) return const [];

    final requests = <Future<List<TargetDto>>>[];
    for (var start = 0; start < uniqueIds.length; start += 100) {
      final end = start + 100 < uniqueIds.length
          ? start + 100
          : uniqueIds.length;
      final batch = uniqueIds.sublist(start, end);
      requests.add(
        _load(() async {
          final response = await _api.getTargets(batch);
          return response.targets;
        }),
      );
    }
    final responses = await Future.wait(requests);
    return List.unmodifiable(responses.expand((targets) => targets));
  }

  Future<T> _load<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on DioException catch (error, stackTrace) {
      Error.throwWithStackTrace(_toLoadException(error), stackTrace);
    } on CheckedFromJsonException catch (_, stackTrace) {
      Error.throwWithStackTrace(const UnexpectedLoadException(), stackTrace);
    } on FormatException catch (_, stackTrace) {
      Error.throwWithStackTrace(const UnexpectedLoadException(), stackTrace);
    } on TypeError catch (_, stackTrace) {
      Error.throwWithStackTrace(const UnexpectedLoadException(), stackTrace);
    }
  }

  LoadException _toLoadException(DioException error) {
    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.transformTimeout => const TimeoutLoadException(),
      DioExceptionType.connectionError => const NetworkLoadException(),
      DioExceptionType.badResponse => switch (error.response?.statusCode) {
        404 => const NotFoundLoadException(),
        final int statusCode => ServerLoadException(statusCode: statusCode),
        null => const UnexpectedLoadException(),
      },
      _ => const UnexpectedLoadException(),
    };
  }
}
