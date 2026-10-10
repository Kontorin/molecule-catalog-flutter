import '../domain/i_molecule_repository.dart';
import '../domain/molecule_model.dart';
import 'mock_molecules.dart';

class MoleculeRepository implements IMoleculeRepository {
  @override
  Future<List<MoleculeModel>> getMolecules() async {
    return mockMolecules;
  }

  @override
  Future<MoleculeModel?> getMolecule(String id) async {
    for (final molecule in mockMolecules) {
      if (molecule.id == id) {
        return molecule;
      }
    }

    return null;
  }

  @override
  Future<MoleculeModel?> getMoleculeByName(String name) async {
    for (final molecule in mockMolecules) {
      if (molecule.name == name) {
        return molecule;
      }
    }

    return null;
  }
}
