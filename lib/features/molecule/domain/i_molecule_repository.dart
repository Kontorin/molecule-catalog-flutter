import 'molecule_model.dart';

abstract interface class IMoleculeRepository {
  Future<List<MoleculeModel>> getMolecules({String query = ''});

  Future<MoleculeModel?> getMolecule(String id);
}
