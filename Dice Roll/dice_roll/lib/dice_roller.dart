import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var diceRoll = 2;

  void rollDice() {
    setState(() {
      diceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dice-$diceRoll.png',
              width: 150,
            ),
            const SizedBox(height: 20,),
            TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(10),
                textStyle: const TextStyle(fontSize: 25)),
                child: const Text("Roll Dice"),
            )
          ],
        );
  }
}