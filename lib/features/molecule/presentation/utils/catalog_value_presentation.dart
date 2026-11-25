import '../../../../l10n/app_localizations.dart';

extension CatalogValuePresentation on String {
  String orUnavailable(AppLocalizations l10n) {
    return trim().isEmpty ? l10n.dataUnavailable : this;
  }
}
