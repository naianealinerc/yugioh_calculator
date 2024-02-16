import 'package:yugioh/core/utils/player_enum.dart';

class MatchGameModel {
  final int? id;
  final int lifePlayer1;
  final int lifePlayer2;
  final String? winningPlayer;

  const MatchGameModel({
    this.id,
    required this.lifePlayer1,
    required this.lifePlayer2,
    required this.winningPlayer,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lifePlayer1': lifePlayer1,
      'lifePlayer2': lifePlayer2,
      'winningPlayer': winningPlayer,
    };
  }

  factory MatchGameModel.fromMap(Map<String, dynamic> map) {
    return MatchGameModel(
      id: map['id'],
      lifePlayer1: map['lifePlayer1'],
      lifePlayer2: map['lifePlayer2'],
      winningPlayer: map['winningPlayer'],
    );
  }

  @override
  String toString() {
    return 'MatchGameModel{id: $id, lifePlayer1: $lifePlayer1, lifePlayer2: $lifePlayer2, winningPlayer: $winningPlayer,}';
  }
}
