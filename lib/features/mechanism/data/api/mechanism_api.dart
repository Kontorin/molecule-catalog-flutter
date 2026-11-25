import 'package:dio/dio.dart';

import '../dto/mechanism_dto.dart';
import '../dto/mechanism_list_dto.dart';
import '../dto/target_list_dto.dart';

class MechanismApi {
  MechanismApi(this._dio);

  final Dio _dio;

  Future<MechanismListDto> getMechanisms({
    String? moleculeId,
    String? parentMoleculeId,
    int offset = 0,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'mechanism.json',
      queryParameters: {
        'molecule_chembl_id': ?moleculeId,
        'parent_molecule_chembl_id': ?parentMoleculeId,
        'limit': 100,
        'offset': offset,
        'order_by': 'mec_id',
      },
    );
    final json = response.data;
    if (json == null) {
      throw const FormatException('Empty mechanism list response');
    }

    return MechanismListDto.fromJson(json);
  }

  Future<MechanismDto> getMechanism(int id) async {
    final response = await _dio.get<Map<String, dynamic>>('mechanism/$id.json');
    final json = response.data;
    if (json == null) {
      throw const FormatException('Empty mechanism response');
    }

    return MechanismDto.fromJson(json);
  }

  Future<TargetListDto> getTargets(List<String> ids) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'target.json',
      queryParameters: {
        'target_chembl_id__in': ids.join(','),
        'only': 'target_chembl_id,pref_name',
        'limit': 100,
      },
    );
    final json = response.data;
    if (json == null) {
      throw const FormatException('Empty target list response');
    }

    return TargetListDto.fromJson(json);
  }
}
