import '../dto/molecule_dto.dart';

abstract interface class IMoleculeDataSource {
  Future<List<MoleculeDto>> getMolecules();

  Future<MoleculeDto> getMolecule(String id);
}
