import '../../../common/network/load_exception.dart';
import '../domain/i_molecule_repository.dart';
import '../domain/molecule_model.dart';
import 'data_sources/i_molecule_data_source.dart';
import 'mappers/molecule_mapper.dart';

class MoleculeRepository implements IMoleculeRepository {
  MoleculeRepository(this._dataSource);

  final IMoleculeDataSource _dataSource;

  @override
  Future<List<MoleculeModel>> getMolecules() async {
    final molecules = await _dataSource.getMolecules();
    return List.unmodifiable(molecules.map((molecule) => molecule.toModel()));
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
