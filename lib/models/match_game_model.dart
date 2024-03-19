import 'package:yugioh/core/utils/player_enum.dart';

class MatchGameModel {
  final int? id;
  final int lifePlayer1;
  final int lifePlayer2;
  final String? winningPlayer;
  final String? date;

  const MatchGameModel({
    this.id,
    required this.lifePlayer1,
    required this.lifePlayer2,
    required this.winningPlayer,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lifePlayer1': lifePlayer1,
      'lifePlayer2': lifePlayer2,
      'winningPlayer': winningPlayer,
      'date': date,
    };
  }

  factory MatchGameModel.fromMap(Map<String, dynamic> map) {
    return MatchGameModel(
      id: map['id'],
      lifePlayer1: map['lifePlayer1'],
      lifePlayer2: map['lifePlayer2'],
      winningPlayer: map['winningPlayer'],
      date: map['date'],
    );
  }

  @override
  String toString() {
    return 'MatchGameModel{id: $id, lifePlayer1: $lifePlayer1, lifePlayer2: $lifePlayer2, winningPlayer: $winningPlayer, date: $date}';
  }
}
