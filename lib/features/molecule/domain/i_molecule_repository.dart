import 'molecule_model.dart';

abstract interface class IMoleculeRepository {
  Future<List<MoleculeModel>> getMolecules();

  Future<MoleculeModel?> getMolecule(String id);
}
