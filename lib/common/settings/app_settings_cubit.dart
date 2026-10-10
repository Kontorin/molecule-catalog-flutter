import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit() : super(const AppSettingsState());

  void setDarkTheme(bool enabled) {
    emit(
      state.copyWith(
        themeMode: enabled ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }

  void setLanguage(String languageCode) {
    if (languageCode != 'ru' && languageCode != 'en') {
      return;
    }

    emit(state.copyWith(locale: Locale(languageCode)));
  }
}
