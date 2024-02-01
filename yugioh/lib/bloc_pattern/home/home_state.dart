import 'package:yugioh/core/utils/player_enum.dart';

class GameState {
  final int? lifePlayer1;
  final int? lifePlayer2;
  final PlayerEnum? playerSelected;

  GameState({
    this.lifePlayer1,
    this.lifePlayer2,
    this.playerSelected,
  });
}

class GameCounterStateLoading extends GameState {}

class GameCounterStateError extends GameState {
  String message;

  GameCounterStateError({required this.message});
}
