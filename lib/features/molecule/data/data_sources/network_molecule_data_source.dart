import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../common/network/load_exception.dart';
import '../api/molecule_api.dart';
import '../dto/molecule_dto.dart';
import 'i_molecule_data_source.dart';

class NetworkMoleculeDataSource implements IMoleculeDataSource {
  NetworkMoleculeDataSource(this._api);

  final MoleculeApi _api;

  @override
  Future<List<MoleculeDto>> getMolecules() async {
    final response = await _load(_api.getMolecules);
    return response.molecules;
  }

  @override
  Future<MoleculeDto> getMolecule(String id) {
    return _load(() => _api.getMolecule(id));
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
