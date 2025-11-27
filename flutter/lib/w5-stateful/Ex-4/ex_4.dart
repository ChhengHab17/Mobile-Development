import 'package:flutter/material.dart';

const MAX_SCORE = 10;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[200],
        body: Column(
          children: [
            ScoreCard(title: "React Score", score: 4),
            ScoreCard(title: "Flutter Score", score: 10),
            ScoreCard(title: "Dart Score", score: 7),
          ],
        ),
      ),
    ),
  );
}

class ScoreCard extends StatefulWidget {
  final String title;
  final int score;
  const ScoreCard({super.key, required this.title, this.score = 0});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late int currentScore;
  @override
  void initState() {
    super.initState();
    currentScore = widget.score;
  }

  double get scoreBar => currentScore / MAX_SCORE;
  Color get barColor {
    if (currentScore < 4) return Colors.green[100]!;
    if (currentScore < 8) return Colors.green[300]!;
    return Colors.green[500]!;
  }

  void increase() {
    setState(() {
      if (currentScore < MAX_SCORE) {
        currentScore++;
      }
    });
  }

  void decrease() {
    setState(() {
      if (currentScore > 0) {
        currentScore--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          children: [
            Text(widget.title),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(action: decrease, label: '-'),
                Button(action: increase, label: '+'),
              ],
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0.5, color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                FractionallySizedBox(
                  widthFactor: scoreBar,
                  child: Container(
                    height: 40,
                    // width: 40,
                    decoration: BoxDecoration(
                      color: barColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String label;
  final VoidCallback action;
  const Button({super.key, required this.action, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      onPressed: action,
      child: Text(label),
    );
  }
}
