import '../../../common/network/load_exception.dart';
import '../domain/i_molecule_repository.dart';
import '../domain/molecule_model.dart';
import '../domain/molecule_page_model.dart';
import 'data_sources/i_molecule_data_source.dart';
import 'mappers/molecule_mapper.dart';
import 'mappers/molecule_page_mapper.dart';

class MoleculeRepository implements IMoleculeRepository {
  MoleculeRepository(this._dataSource);

  final IMoleculeDataSource _dataSource;

  @override
  Future<MoleculePageModel> getMolecules({
    String query = '',
    int offset = 0,
  }) async {
    final page = await _dataSource.getMolecules(query: query, offset: offset);
    return page.toModel();
  }

  @override
  Future<MoleculeModel?> getMolecule(String id) async {
    try {
      final molecule = await _dataSource.getMolecule(id);
      return molecule.toModel();
    } on NotFoundLoadException {
      return null;
    }
  }
}
