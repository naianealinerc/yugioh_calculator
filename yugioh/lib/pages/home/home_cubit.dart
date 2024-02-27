import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugioh/core/utils/player_enum.dart';
import 'package:yugioh/pages/home/home_state_cubit.dart';
import 'package:yugioh/models/match_game_model.dart';
import 'package:yugioh/repositories/home_repository.dart';

class LifeCounterCubit extends Cubit<GameStateCubit> {
  final HomeRepository repository;

  int _lifePlayer1 = 8000;
  int _lifePlayer2 = 8000;

  LifeCounterCubit(this.repository)
      : super(InitialState(lifePlayer1: 8000, lifePlayer2: 8000));

  addLifePlayer({required int value, PlayerEnum? selectedPlayer}) {
    emit(LoadingState());
    try {
      if (selectedPlayer == PlayerEnum.player1) {
        _lifePlayer1 += value;
        emit(LoadedState(lifePlayer1: _lifePlayer1, lifePlayer2: _lifePlayer2));
      } else if (selectedPlayer == PlayerEnum.player2) {
        _lifePlayer2 += value;
        emit(LoadedState(lifePlayer1: _lifePlayer1, lifePlayer2: _lifePlayer2));
      }
    } on Exception catch (e) {
      emit(GameStateCubitError(
          message: 'Erro ao adicionar vida de jogador: $e'));
    }
  }

  removeLifePlayer({required int value, required PlayerEnum? selectedPlayer}) {
    try {
      if (selectedPlayer == PlayerEnum.player1) {
        _lifePlayer1 -= value;
        emit(LoadedState(
            lifePlayer1: _lifePlayer1,
            lifePlayer2: _lifePlayer2,
            playerSelected: null));
      } else if (selectedPlayer == PlayerEnum.player2) {
        _lifePlayer2 -= value;
        emit(LoadedState(
            lifePlayer1: _lifePlayer1,
            lifePlayer2: _lifePlayer2,
            playerSelected: null));
      }
    } on Exception catch (e) {
      emit(GameStateCubitError(message: 'Erro ao remover vida de jogador: $e'));
    }
  }

  resetGame(GameStateCubit state) async {
    if (state is LoadedState) {
      final game = state;

      try {
        final match = MatchGameModel(
          id: null,
          lifePlayer1: game.lifePlayer1!,
          lifePlayer2: game.lifePlayer2!,
          winningPlayer: _selectWinningPlayer(game),
        );

        await repository.insertMatch(match);

        _lifePlayer1 = 8000;
        _lifePlayer2 = 8000;
        emit(
            InitialState(lifePlayer1: _lifePlayer1, lifePlayer2: _lifePlayer2));
      } catch (e) {
        emit(GameStateCubitError(message: "Erro ao resetar jogo"));
      }
    }
  }

  _selectWinningPlayer(LoadedState game) {
    if (game.lifePlayer1 != null && game.lifePlayer2 != null) {
      if (game.lifePlayer1! > game.lifePlayer2!) {
        return "Player 1";
      } else if (game.lifePlayer2! > game.lifePlayer1!) {
        return "Player 2";
      } else {
        return null;
      }
    }
  }

  void setSelectedPlayer(PlayerEnum player) {
    emit(LoadedState(
      lifePlayer1: _lifePlayer1,
      lifePlayer2: _lifePlayer2,
      playerSelected: player,
    ));
  }
}
