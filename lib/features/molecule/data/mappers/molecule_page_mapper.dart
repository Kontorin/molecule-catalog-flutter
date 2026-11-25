import '../../domain/molecule_page_model.dart';
import '../dto/molecule_list_dto.dart';
import 'molecule_mapper.dart';

extension MoleculeListDtoMapper on MoleculeListDto {
  MoleculePageModel toModel() {
    return MoleculePageModel(
      molecules: molecules.map((molecule) => molecule.toModel()).toList(),
      totalCount: pageMeta.totalCount,
      nextOffset: pageMeta.next == null
          ? null
          : pageMeta.offset + pageMeta.limit,
    );
  }
}
