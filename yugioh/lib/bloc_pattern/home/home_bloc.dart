import 'dart:async';

import 'package:yugioh/bloc_pattern/home/home_state.dart';
import 'package:yugioh/core/utils/player_enum.dart';

class LifeCounterBloc {
  int _lifePlayer1 = 8000;
  int _lifePlayer2 = 8000;

  final _lifeCounter = StreamController<GameState>.broadcast();
  Stream<GameState> get lifeCounterStream => _lifeCounter.stream;

  LifeCounterBloc() {
    Future.delayed(const Duration(microseconds: 600), () {
      _lifeCounter.add(GameCounterStateLoading());
    });

    Future.delayed(const Duration(seconds: 1), () {
      _lifeCounter
          .add(GameState(lifePlayer1: _lifePlayer1, lifePlayer2: _lifePlayer2));
    });
  }

  addLifePlayer({required int value, PlayerEnum? selectedPlayer}) {
    try {
      if (selectedPlayer == PlayerEnum.player1) {
        _lifePlayer1 += value;
        _lifeCounter.sink.add(
            GameState(lifePlayer1: _lifePlayer1, lifePlayer2: _lifePlayer2));
      } else if (selectedPlayer == PlayerEnum.player2) {
        _lifePlayer2 += value;
        _lifeCounter.sink.add(
            GameState(lifePlayer1: _lifePlayer1, lifePlayer2: _lifePlayer2));
      }
    } on Exception catch (e) {
      _lifeCounter.add(GameCounterStateError(
          message: 'Erro ao adicionar vida de jogador: $e'));
    }
  }

  removeLifePlayer({required int value, required PlayerEnum? selectedPlayer}) {
    try {
      if (selectedPlayer == PlayerEnum.player1) {
        _lifePlayer1 -= value;
        _lifeCounter.sink.add(GameState(
            lifePlayer1: _lifePlayer1,
            lifePlayer2: _lifePlayer2,
            playerSelected: null));
      } else if (selectedPlayer == PlayerEnum.player2) {
        _lifePlayer2 -= value;
        _lifeCounter.sink.add(GameState(
            lifePlayer1: _lifePlayer1,
            lifePlayer2: _lifePlayer2,
            playerSelected: null));
      }
    } on Exception catch (e) {
      _lifeCounter.add(GameCounterStateError(
          message: 'Erro ao remover vida de jogador: $e'));
    }
  }

  resetGame() {
    _lifePlayer1 = 8000;
    _lifePlayer2 = 8000;
    _lifeCounter.sink
        .add(GameState(lifePlayer1: _lifePlayer1, lifePlayer2: _lifePlayer2));
  }

  void setSelectedPlayer(PlayerEnum player) {
    _lifeCounter.add(GameState(
      lifePlayer1: _lifePlayer1,
      lifePlayer2: _lifePlayer2,
      playerSelected: player,
    ));
  }

  void dispose() {
    _lifeCounter.close();
  }
}
