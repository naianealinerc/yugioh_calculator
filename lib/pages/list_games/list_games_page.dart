import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugioh/core/widgets/custom_app_bar.dart';
import 'package:yugioh/core/widgets/drawer_app.dart';
import 'package:yugioh/core/widgets/info_game_historic.dart';
import 'package:yugioh/models/match_game_model.dart';
import 'package:yugioh/pages/home/home_state.dart';
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

class ListViewGames extends StatelessWidget {
  const ListViewGames({
    super.key,
    required this.listGames,
    required this.onTapDelete,
  });

  final List<MatchGameModel> listGames;
  final void Function(MatchGameModel match) onTapDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listGames.length,
      itemBuilder: (context, index) {
        final item = listGames[index];
        return Dismissible(
          key: Key("${item.id}"),
          onDismissed: (direction) {
            onTapDelete(item);
          },
          background: Container(
            color: Colors.redAccent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  onTapDelete(item);
                },
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: Text(
                          item.date ?? "",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                  title: Row(
                    children: [
                      InfoGameHistoric(
                        lifePlayer: "${item.lifePlayer1}",
                        typePlayer: "Jogador 1",
                      ),
                      Icon(
                        Icons.close,
                        size: 30,
                      ),
                      InfoGameHistoric(
                        lifePlayer: "${item.lifePlayer2}",
                        typePlayer: "Jogador 2",
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
