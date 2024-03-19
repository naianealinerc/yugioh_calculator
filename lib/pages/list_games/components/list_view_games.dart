
import 'package:flutter/material.dart';
import 'package:yugioh/models/match_game_model.dart';
import 'package:yugioh/pages/list_games/components/info_game_date.dart';
import 'package:yugioh/pages/list_games/components/info_game_historic.dart';

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
          background: background(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InfoGameDate(item: item),
                    ],
                  ),
                  title: Row(
                    children: [
                      InfoGameHistoric(
                        lifePlayer: "${item.lifePlayer1}",
                        typePlayer: "Jogador 1",
                      ),
                      const Icon(
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

  Container background() {
    return Container(
          color: Colors.redAccent,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),
          ),
        );
  }
}
