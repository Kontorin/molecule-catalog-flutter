import 'package:dio/dio.dart';

import '../dto/molecule_dto.dart';
import '../dto/molecule_list_dto.dart';

class MoleculeApi {
  MoleculeApi(this._dio);

  final Dio _dio;

  Future<MoleculeListDto> getMolecules({
    String query = '',
    int offset = 0,
  }) async {
    final searchQuery = query.trim();
    final isChemblId = RegExp(
      r'^CHEMBL\d+$',
      caseSensitive: false,
    ).hasMatch(searchQuery);
    final response = await _dio.get<Map<String, dynamic>>(
      'molecule.json',
      queryParameters: {
        'limit': 20,
        'offset': offset,
        'only':
            'molecule_chembl_id,pref_name,molecule_properties,structure_type',
        if (isChemblId)
          'molecule_chembl_id': searchQuery.toUpperCase()
        else if (searchQuery.isNotEmpty)
          'pref_name__icontains': searchQuery,
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
