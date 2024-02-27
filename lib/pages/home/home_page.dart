import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yugioh/core/utils/player_enum.dart';
import 'package:yugioh/core/widgets/box_life_player.dart';
import 'package:yugioh/core/widgets/counter_text_form_field.dart';
import 'package:yugioh/pages/home/home_cubit.dart';
import 'package:yugioh/pages/home/home_state.dart';

class CounterGameCubit extends StatefulWidget {
  const CounterGameCubit({super.key});

  @override
  State<CounterGameCubit> createState() => _CounterGameCubitState();
}

class _CounterGameCubitState extends State<CounterGameCubit> {
  final counterController = TextEditingController(text: "0");
  PlayerEnum? playerSelected;

  @override
  void dispose() {
    super.dispose();
    counterController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yu-Gi-Oh!"),
        actions: [
          IconButton(
              onPressed: () {
                final state = BlocProvider.of<LifeCounterCubit>(context).state;
                BlocProvider.of<LifeCounterCubit>(context).resetGame(state);
                // final list =
                //     BlocProvider.of<LifeCounterCubit>(context).getGames();

                counterController.text = '';
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<LifeCounterCubit, GameStateCubit>(
              builder: (context, state) {
                int player1 = 0;
                int player2 = 0;
                PlayerEnum? playerSelected;

                if (state is InitialState) {
                  player1 = state.lifePlayer1 ?? 0;
                  player2 = state.lifePlayer2 ?? 0;
                  playerSelected = state.playerSelected;
                }
                if (state is LoadedState) {
                  player1 = state.lifePlayer1 ?? 0;
                  player2 = state.lifePlayer2 ?? 0;
                  playerSelected = state.playerSelected;
                }

                return Column(
                  children: [
                    Row(
                      children: [
                        BoxPlayer(
                          onTap: () {
                            BlocProvider.of<LifeCounterCubit>(context)
                                .setSelectedPlayer(PlayerEnum.player2);
                          },
                          playerLife: player2,
                          typePlayer: PlayerEnum.player2,
                          playerSelected: playerSelected,
                        ),
                        BoxPlayer(
                          onTap: () {
                            BlocProvider.of<LifeCounterCubit>(context)
                                .setSelectedPlayer(PlayerEnum.player1);
                          },
                          playerLife: player1,
                          typePlayer: PlayerEnum.player1,
                          playerSelected: playerSelected,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: CounterForm(
                          controller: counterController,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<LifeCounterCubit>(context)
                                .addLifePlayer(
                              value: int.parse(counterController.text),
                              selectedPlayer: playerSelected,
                            );
                          },
                          child: const Icon(Icons.add),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<LifeCounterCubit>(context)
                                .removeLifePlayer(
                              value: int.parse(counterController.text),
                              selectedPlayer: playerSelected,
                            );
                          },
                          child: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    if (state is LoadingState)
                      const CircularProgressIndicator(),
                    if (state is GameStateCubitError) Text(state.message),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
