import 'package:flutter/material.dart';
import 'package:yugioh/core/utils/player_enum.dart';

class BoxPlayer extends StatelessWidget {
  const BoxPlayer({
    super.key,
    // required this.controller,
    required this.playerLife,
    required this.typePlayer,
    required this.playerSelected,
    this.onTap,
  });
  

  // final LifeCounterBloc controller;
  final int playerLife;
  final PlayerEnum? playerSelected;
  final PlayerEnum typePlayer;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        // onTap: () => controller.setSelectedPlayer(typePlayer),
        onTap: onTap,
        child: Container(
          height: 200,
          color: typePlayer == PlayerEnum.player2
              ? const Color(0xffb52b04)
              : const Color(0xff0048b9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      typePlayer == PlayerEnum.player1
                          ? "Player 1"
                          : "Player 2",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "$playerLife",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: Column(
                  children: [
                    if (playerSelected == typePlayer)
                      const Icon(
                        Icons.check_circle,
                        size: 30,
                        color: Colors.white,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
