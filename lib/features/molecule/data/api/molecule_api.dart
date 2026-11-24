import 'package:dio/dio.dart';

import '../dto/molecule_dto.dart';
import '../dto/molecule_list_dto.dart';

class MoleculeApi {
  MoleculeApi(this._dio);

  final Dio _dio;

  Future<MoleculeListDto> getMolecules() async {
    final response = await _dio.get<Map<String, dynamic>>(
      'molecule.json',
      queryParameters: {
        'limit': 20,
        'pref_name__isnull': false,
        'order_by': 'molecule_chembl_id',
      },
    );
    final json = response.data;
    if (json == null) {
      throw const FormatException('Empty molecule list response');
    }

    return MoleculeListDto.fromJson(json);
  }

  Future<MoleculeDto> getMolecule(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'molecule/${Uri.encodeComponent(id)}.json',
    );
    final json = response.data;
    if (json == null) {
      throw const FormatException('Empty molecule response');
    }

    return MoleculeDto.fromJson(json);
  }
}
