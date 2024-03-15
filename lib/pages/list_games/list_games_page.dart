import 'package:flutter/material.dart';
import 'package:yugioh/core/widgets/custom_app_bar.dart';
import 'package:yugioh/core/widgets/drawer_app.dart';

class ListGamesPage extends StatelessWidget {
  const ListGamesPage({super.key});

  static const routeName = '/history_games';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: DrawerApp(),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
