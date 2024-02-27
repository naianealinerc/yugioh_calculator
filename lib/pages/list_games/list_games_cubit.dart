import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugioh/pages/home/home_state.dart';
import 'package:yugioh/repositories/home_repository.dart';

class ListGamesCubit extends Cubit<GameStateCubit> {
  final HomeRepository repository;

  ListGamesCubit(this.repository)
      : super(InitialState(lifePlayer1: 8000, lifePlayer2: 8000));

  getGames() async {
    try {
      final list = await repository.getListMatchs();

      print(list);
    } catch (e) {}
  }
}
