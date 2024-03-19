import 'package:yugioh/models/match_game_model.dart';

sealed class ListGamesState {}

class InitialListGamesState extends ListGamesState {
  final List<MatchGameModel> list;

  InitialListGamesState({this.list = const []});
}

class LoadedListGamesState extends ListGamesState {
  final List<MatchGameModel> list;

  LoadedListGamesState({required this.list});
}

class ErrorListGamesState extends ListGamesState {
  String message;

  ErrorListGamesState({required this.message});
}
