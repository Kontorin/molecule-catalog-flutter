import 'molecule_model.dart';
import 'molecule_page_model.dart';

abstract interface class IMoleculeRepository {
  Future<MoleculePageModel> getMolecules({String query = '', int offset = 0});

  Future<MoleculeModel?> getMolecule(String id);
}
