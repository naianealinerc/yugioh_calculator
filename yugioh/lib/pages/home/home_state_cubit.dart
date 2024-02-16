import 'package:yugioh/core/utils/player_enum.dart';

sealed class GameStateCubit {}

class InitialState implements GameStateCubit {
  final int? lifePlayer1;
  final int? lifePlayer2;
  final PlayerEnum? playerSelected;
  
  InitialState({this.lifePlayer1, this.lifePlayer2, this.playerSelected});
}

class LoadingState implements GameStateCubit {}

class LoadedState implements GameStateCubit {
  final int? lifePlayer1;
  final int? lifePlayer2;
  final PlayerEnum? playerSelected;

  LoadedState({this.lifePlayer1, this.lifePlayer2, this.playerSelected});
}

class GameStateCubitError implements GameStateCubit {
  String message;

  GameStateCubitError({required this.message});
}
