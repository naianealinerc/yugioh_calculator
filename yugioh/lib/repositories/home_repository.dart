import 'package:yugioh/models/match_game_model.dart';

abstract interface class HomeRepository {
  Future<void> init();
  Future<void> insertMatch(MatchGameModel match);
  Future<void> deleteMatch(MatchGameModel match);
  Future<List<MatchGameModel>> getListMatchs();
}
