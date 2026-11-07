import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/app_localizations.dart';
import '../settings/app_settings_cubit.dart';
import '../settings/app_settings_state.dart';

class AppSettingsActions extends StatelessWidget {
  const AppSettingsActions({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (context, state) {
        final cubit = context.read<AppSettingsCubit>();

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Tooltip(
              message: l10n.darkTheme,
              child: Switch(
                value: state.themeMode == ThemeMode.dark,
                onChanged: cubit.setDarkTheme,
              ),
            ),
            PopupMenuButton<String>(
              tooltip: l10n.language,
              icon: const Icon(Icons.language),
              initialValue: state.locale.languageCode,
              onSelected: cubit.setLanguage,
              itemBuilder: (context) => [
                PopupMenuItem(value: 'ru', child: Text(l10n.russian)),
                PopupMenuItem(value: 'en', child: Text(l10n.english)),
              ],
            ),
          ],
        );
      },
    );
  }
}
