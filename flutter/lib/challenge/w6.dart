import 'dart:math';

import 'package:flutter/material.dart';

const String diceImage1 = 'assets/w6/dice-1.png';
const String diceImage2 = 'assets/w6/dice-2.png';
const String diceImage3 = 'assets/w6/dice-3.png';
const String diceImage4 = 'assets/w6/dice-4.png';
const String diceImage5 = 'assets/w6/dice-5.png';
const String diceImage6 = 'assets/w6/dice-6.png';

String activeDiceImage = diceImage2;

int randomNum (){
  var num = Random().nextInt(6) + 1;
  return num;  
}

String randomRollDice (){
  int num = randomNum();
  switch (num){
    case 1: 
      return diceImage1;
    case 2: 
      return diceImage2;
    case 3: 
      return diceImage3;
    case 4: 
      return diceImage4;
    case 5:
      return diceImage5;
    case 6: 
      return diceImage6;
  }
  return '';
}
class DiceRoller extends StatefulWidget {
  const DiceRoller ({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  
  void rollDice() {
    setState(() {
      activeDiceImage = randomRollDice();
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onDoubleTap: () => rollDice(),
          child: Image.asset(
            activeDiceImage,
            width: 200,
          )
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}

void main() => runApp(const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(child: DiceRoller()),
      ),
    ));