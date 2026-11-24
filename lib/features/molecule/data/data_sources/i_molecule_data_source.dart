import '../dto/molecule_dto.dart';
import '../dto/molecule_list_dto.dart';

abstract interface class IMoleculeDataSource {
  Future<MoleculeListDto> getMolecules({String query = '', int offset = 0});

  Future<MoleculeDto> getMolecule(String id);
}
