import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugioh/models/match_game_model.dart';
import 'package:yugioh/pages/list_games/list_games_state.dart';
import 'package:yugioh/repositories/home_repository.dart';

class ListGamesCubit extends Cubit<ListGamesState> {
  final HomeRepository repository;

  ListGamesCubit(this.repository) : super(InitialListGamesState());

  getGames() async {
    try {
      final list = await repository.getListMatchs();

      emit(LoadedListGamesState(list: list));
    } catch (e) {
      emit(ErrorListGamesState(message: "Erro ao carregar lista de jogos"));
    }
  }

  deleteGames(MatchGameModel match) async {
    try {
      await repository.deleteMatch(match);

      getGames();
    } catch (e) {
      emit(ErrorListGamesState(message: "Erro ao deletar jogo"));
    }
  }
}
