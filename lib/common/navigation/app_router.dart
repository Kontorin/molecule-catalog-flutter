import 'package:go_router/go_router.dart';

import '../../features/molecule/presentation/view/molecule_detail_screen.dart';
import '../../features/molecule/presentation/view/molecule_list_screen.dart';
import '../../features/molecule/presentation/view/molecule_mechanism_screen.dart';

import 'app_routes.dart';

class AppRouter {
  static GoRouter create() {
    GoRouter.optionURLReflectsImperativeAPIs = true;

    return GoRouter(
      routes: [
        GoRoute(
          path: AppRoutes.list,
          builder: (context, state) => const MoleculeListScreen(),
          routes: [
            GoRoute(
              path: AppRoutes.moleculePath,
              builder: (context, state) => MoleculeDetailScreen(
                key: state.pageKey,
                id: state.pathParameters[AppRoutes.moleculeIdParameter]!,
              ),
              routes: [
                GoRoute(
                  path: AppRoutes.mechanismPath,
                  builder: (context, state) => MoleculeMechanismScreen(
                    key: state.pageKey,
                    moleculeId:
                        state.pathParameters[AppRoutes.moleculeIdParameter]!,
                    mechanismId:
                        state.pathParameters[AppRoutes.mechanismIdParameter]!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
