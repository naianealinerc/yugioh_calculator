

import 'package:flutter/material.dart';

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
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Histórico de jogos'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
