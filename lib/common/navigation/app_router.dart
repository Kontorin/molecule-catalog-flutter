import 'package:go_router/go_router.dart';

import '../../features/mechanism/presentation/view/mechanism_detail_screen.dart';
import '../../features/molecule/presentation/view/molecule_detail_screen.dart';
import '../../features/molecule/presentation/view/molecule_list_screen.dart';

class AppRouter {
  static GoRouter create() {
    GoRouter.optionURLReflectsImperativeAPIs = true;

    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const MoleculeListScreen(),
          routes: [
            GoRoute(
              path: 'molecule/:id',
              builder: (context, state) => MoleculeDetailScreen(
                key: state.pageKey,
                id: state.pathParameters['id']!,
              ),
              routes: [
                GoRoute(
                  path: 'mechanism/:mechanismId',
                  builder: (context, state) => MechanismDetailScreen(
                    key: state.pageKey,
                    moleculeId: state.pathParameters['id']!,
                    mechanismId: state.pathParameters['mechanismId']!,
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
