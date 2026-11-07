import 'package:flutter/material.dart';

class AppSettingsState {
  const AppSettingsState({
    this.themeMode = ThemeMode.light,
    this.locale = const Locale('ru'),
  });

  final ThemeMode themeMode;
  final Locale locale;

  AppSettingsState copyWith({ThemeMode? themeMode, Locale? locale}) {
    return AppSettingsState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}
