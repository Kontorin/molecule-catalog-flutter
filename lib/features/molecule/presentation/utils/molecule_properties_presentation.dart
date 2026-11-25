import '../../../../l10n/app_localizations.dart';
import '../../domain/molecule_properties_model.dart';

extension MoleculePropertiesPresentation on MoleculePropertiesModel {
  String formattedFormula(AppLocalizations l10n) {
    return formula.isEmpty ? l10n.dataUnavailable : formula;
  }

  String formattedMolecularWeight(AppLocalizations l10n) {
    return molecularWeight.isEmpty
        ? l10n.dataUnavailable
        : '$molecularWeight ${l10n.molecularWeightUnit}';
  }
}
