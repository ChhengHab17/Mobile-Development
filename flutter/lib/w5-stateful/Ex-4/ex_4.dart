import 'package:flutter/material.dart';

const MAX_SCORE = 10;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            ScoreCard(title: "hii", score: 4,),
            ScoreCard(title: "hello", score: 10),
          ]
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
  void initState(){
    super.initState();
    currentScore = widget.score;
  }
  double get scoreBar => currentScore / MAX_SCORE;
  void increase (){
    setState(() {
      if(currentScore < MAX_SCORE){
        currentScore++;
      }
    });
  }
  void decrease (){
    setState(() {
      if(currentScore > 0){
        currentScore--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey,
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
                ElevatedButton(onPressed: decrease, child: Text('-')),
                ElevatedButton(onPressed: increase, child: Text('+')),
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
                      color: Colors.blue,
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
