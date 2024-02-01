import 'package:flutter/material.dart';
import 'package:yugioh/bloc_pattern/home/home_bloc.dart';
import 'package:yugioh/bloc_pattern/home/home_state.dart';
import 'package:yugioh/core/utils/player_enum.dart';
import 'package:yugioh/core/widgets/box_life_player.dart';
import 'package:yugioh/core/widgets/counter_text_form_field.dart';

class CounterGame extends StatefulWidget {
  const CounterGame({super.key});

  @override
  State<CounterGame> createState() => _CounterGameState();
}

class _CounterGameState extends State<CounterGame> {
  final controller = LifeCounterBloc();
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
                controller.resetGame();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: controller.lifeCounterStream,
            builder: (context, snapshot) {
              final player1 = snapshot.data?.lifePlayer1 ?? 0;
              final player2 = snapshot.data?.lifePlayer2 ?? 0;
              final playerSelected = snapshot.data?.playerSelected;
              return Column(
                children: [
                  Row(
                    children: [
                      BoxPlayer(
                        controller: controller,
                        playerLife: player2,
                        typePlayer: PlayerEnum.player2,
                        playerSelected: playerSelected,
                      ),
                      BoxPlayer(
                        controller: controller,
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
                          controller.addLifePlayer(
                            value: int.parse(counterController.text),
                            selectedPlayer: playerSelected,
                          );
                        },
                        child: const Icon(Icons.add),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.removeLifePlayer(
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
                  StreamBuilder(
                    stream: controller.lifeCounterStream,
                    builder: (context, snapshot) {
                      final value = snapshot.data;

                      if (value is GameCounterStateLoading) {
                        return const CircularProgressIndicator();
                      }

                      if (value is GameCounterStateError) {
                        return Text(value.message);
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
