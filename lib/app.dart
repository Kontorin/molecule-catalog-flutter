import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'common/navigation/app_router.dart';
import 'common/settings/app_settings_cubit.dart';
import 'common/settings/app_settings_state.dart';
import 'common/theme/app_theme.dart';
import 'features/mechanism/data/mechanism_repository.dart';
import 'features/mechanism/domain/i_mechanism_repository.dart';
import 'features/molecule/data/molecule_repository.dart';
import 'features/molecule/domain/i_molecule_repository.dart';
import 'features/molecule/presentation/bloc/list/molecule_list_cubit.dart';
import 'l10n/app_localizations.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GoRouter _router = AppRouter.create();

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IMoleculeRepository>(
          create: (context) => MoleculeRepository(),
        ),
        RepositoryProvider<IMechanismRepository>(
          create: (context) => MechanismRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppSettingsCubit()),
          BlocProvider(
            create: (context) => MoleculeListCubit(
              context.read<IMoleculeRepository>(),
            )..load(),
          ),
        ],
        child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              onGenerateTitle: (context) =>
                  AppLocalizations.of(context)!.catalogTitle,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: state.themeMode,
              locale: state.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: _router,
            );
          },
        ),
      ),
    );
  }
}
