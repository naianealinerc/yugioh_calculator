import 'package:go_router/go_router.dart';
import 'package:yugioh/pages/home/home_page.dart';
import 'package:yugioh/pages/list_games/list_games_page.dart';

class Routes {
  static GoRouter router = GoRouter(
    initialLocation: CounterGameCubit.routeName,
    routes: [
      GoRoute(
        path: CounterGameCubit.routeName,
        builder: (context, state) => const CounterGameCubit(),
      ),
      GoRoute(
        path: ListGamesPage.routeName,
        builder: (context, state) => const ListGamesPage(),
      )
    ],
  );
}
