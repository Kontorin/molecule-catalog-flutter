import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/theme/app_colors.dart';
import '../../../../../common/theme/image_sources.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/molecule_model.dart';

class MoleculeStructureImage extends StatelessWidget {
  const MoleculeStructureImage({super.key, required this.molecule});

  final MoleculeModel molecule;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final imageUrl = molecule.imageUrl;

    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ColoredBox(
          color: AppColors.structureBackground,
          child: imageUrl == null
              ? const _StructurePlaceholder()
              : SvgPicture.network(
                  imageUrl,
                  semanticsLabel: l10n.moleculeStructure(molecule.name),
                  placeholderBuilder: (context) => const Center(
                    child: SizedBox.square(
                      dimension: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.lightPrimary,
                      ),
                    ),
                  ),
                  errorBuilder: (context, error, stackTrace) =>
                      const _StructurePlaceholder(),
                ),
        ),
      ),
    );
  }
}

class _StructurePlaceholder extends StatelessWidget {
  const _StructurePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: AppLocalizations.of(context)!.structurePlaceholder,
      child: const Center(
        child: Icon(
          ImageSources.moleculePlaceholder,
          size: 40,
          color: AppColors.lightOnSurfaceVariant,
        ),
      ),
    );
  }
}
