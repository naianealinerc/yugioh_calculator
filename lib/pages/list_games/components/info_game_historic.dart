import 'package:flutter/material.dart';

class InfoGameHistoric extends StatelessWidget {
  const InfoGameHistoric({
    super.key,
    required this.lifePlayer,
    required this.typePlayer,
  });

  final String lifePlayer;
  final String typePlayer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            lifePlayer,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.black),
          ),
          Text(
            typePlayer,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
