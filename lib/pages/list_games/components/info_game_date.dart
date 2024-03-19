import 'package:flutter/material.dart';
import 'package:yugioh/models/match_game_model.dart';

class InfoGameDate extends StatelessWidget {
  const InfoGameDate({
    super.key,
    required this.item,
  });

  final MatchGameModel item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      child: Text(
        item.date ?? "",
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
