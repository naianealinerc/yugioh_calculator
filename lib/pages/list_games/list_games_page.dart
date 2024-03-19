import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugioh/core/widgets/custom_app_bar.dart';
import 'package:yugioh/core/widgets/drawer_app.dart';
import 'package:yugioh/pages/list_games/components/list_view_games.dart';
import 'package:yugioh/pages/list_games/list_games_cubit.dart';
import 'package:yugioh/pages/list_games/list_games_state.dart';

class ListGamesPage extends StatefulWidget {
  const ListGamesPage({super.key});

  static const routeName = '/history_games';

  @override
  State<ListGamesPage> createState() => _ListGamesPageState();
}

class _ListGamesPageState extends State<ListGamesPage> {
  @override
  void initState() {
    super.initState();
    context.read<ListGamesCubit>().getGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const DrawerApp(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocConsumer<ListGamesCubit, ListGamesState>(
              listener: (context, state) {
                if (state is ErrorListGamesState) {
                  context.read<ListGamesCubit>().getGames();
                }
              },
              builder: (context, state) {
                if (state is InitialListGamesState) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: const Center(child: Text("Sem jogos salvos")),
                  );
                }
                if (state is LoadedListGamesState) {
                  return ListViewGames(
                    listGames: state.list,
                    onTapDelete: (match) {
                      context.read<ListGamesCubit>().deleteGames(match);
                    },
                  );
                }
                if (state is ErrorListGamesState) {
                  return Text(state.message);
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
