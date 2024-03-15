import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yugioh/pages/home/home_page.dart';
import 'package:yugioh/pages/list_games/list_games_page.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 72.0,
              bottom: 32,
            ),
            child: Text(
              'Yu-Gi-Oh! Calculator',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Novo jogo'),
            onTap: () {
              context.go(CounterGameCubit.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Histórico de jogos'),
            onTap: () {
              context.go(ListGamesPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
