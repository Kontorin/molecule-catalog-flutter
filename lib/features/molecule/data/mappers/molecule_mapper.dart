import '../../../../common/network/dio_client.dart';
import '../../domain/molecule_hierarchy_model.dart';
import '../../domain/molecule_model.dart';
import '../../domain/molecule_properties_model.dart';
import '../../domain/molecule_structures_model.dart';
import '../dto/molecule_dto.dart';
import '../dto/molecule_hierarchy_dto.dart';
import '../dto/molecule_properties_dto.dart';
import '../dto/molecule_structures_dto.dart';

extension MoleculeDtoMapper on MoleculeDto {
  MoleculeModel toModel() {
    final displayName = name?.trim();
    // List responses include the type instead of the full structure.
    final hasStructure = structures != null || structureType == 'MOL';

    return MoleculeModel(
      atcClassifications: List.unmodifiable(atcClassifications ?? const []),
      availabilityType: availabilityType ?? -1,
      biotherapeutic: biotherapeutic ?? '',
      blackBoxWarning: blackBoxWarning ?? -1,
      chemicalProbe: chemicalProbe ?? -1,
      chirality: chirality ?? -1,
      crossReferences: List.unmodifiable(crossReferences ?? const []),
      dosedIngredient: dosedIngredient ?? false,
      firstApproval: firstApproval ?? '',
      firstInClass: firstInClass ?? -1,
      helmNotation: helmNotation ?? '',
      inorganicFlag: inorganicFlag ?? -1,
      maxPhase: maxPhase ?? '',
      id: id,
      imageUrl: !hasStructure
          ? null
          : Uri.parse(DioClient.baseUrl)
                .resolve('image/${Uri.encodeComponent(id)}.svg')
                .replace(queryParameters: {'dimensions': '300'})
                .toString(),
      hierarchy: (hierarchy ?? const MoleculeHierarchyDto()).toModel(),
      properties: (properties ?? const MoleculePropertiesDto()).toModel(),
      structures: (structures ?? const MoleculeStructuresDto()).toModel(),
      synonyms: List.unmodifiable(synonyms ?? const []),
      type: type ?? '',
      naturalProduct: naturalProduct ?? -1,
      oral: oral ?? false,
      orphan: orphan ?? -1,
      parenteral: parenteral ?? false,
      polymerFlag: polymerFlag ?? -1,
      name: displayName == null || displayName.isEmpty ? id : displayName,
      prodrug: prodrug ?? -1,
      structureType: structureType ?? '',
      therapeuticFlag: therapeuticFlag ?? false,
      topical: topical ?? false,
      usanStem: usanStem ?? '',
      usanStemDefinition: usanStemDefinition ?? '',
      usanSubstem: usanSubstem ?? '',
      usanYear: usanYear ?? '',
      veterinary: veterinary ?? -1,
      withdrawnFlag: withdrawnFlag ?? false,
    );
  }
}

extension _MoleculeHierarchyDtoMapper on MoleculeHierarchyDto {
  MoleculeHierarchyModel toModel() {
    return MoleculeHierarchyModel(
      activeId: activeId ?? '',
      id: id ?? '',
      parentId: parentId ?? '',
    );
  }
}

extension _MoleculePropertiesDtoMapper on MoleculePropertiesDto {
  MoleculePropertiesModel toModel() {
    return MoleculePropertiesModel(
      alogp: alogp ?? '',
      aromaticRings: aromaticRings ?? -1,
      formula: formula ?? '',
      molecularWeight: molecularWeight ?? '',
      hba: hba ?? -1,
      hbd: hbd ?? -1,
      heavyAtoms: heavyAtoms ?? -1,
      freebaseMolecularWeight: freebaseMolecularWeight ?? '',
      npLikenessScore: npLikenessScore ?? '',
      numRo5Violations: numRo5Violations ?? -1,
      psa: psa ?? '',
      qedWeighted: qedWeighted ?? '',
      ro3Pass: ro3Pass ?? '',
      rtb: rtb ?? -1,
    );
  }
}

extension _MoleculeStructuresDtoMapper on MoleculeStructuresDto {
  MoleculeStructuresModel toModel() {
    return MoleculeStructuresModel(
      canonicalSmiles: canonicalSmiles ?? '',
      molfile: molfile ?? '',
      standardInchi: standardInchi ?? '',
      standardInchiKey: standardInchiKey ?? '',
    );
  }
}
