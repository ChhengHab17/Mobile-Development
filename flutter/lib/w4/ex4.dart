import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomCard(text: 'OPP', color: Colors.blue[100]),
            CustomCard(text: 'DART', color: Colors.blue[300]),
            CustomCard.gradientColor(text: 'FLUTTER', gradient: LinearGradient(colors: [Colors.blue[100]!, Colors.blue[600]!]))
          ],
        )
      )
    )
  );
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;
  const CustomCard({
    super.key,
    required this.text,
    this.color = Colors.blue
  }) : gradient = null;
  const CustomCard.gradientColor({
    super.key,
    required this.text,
    this.gradient,
  }) : color = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? color ?? Colors.blue : null,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text(text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          decoration: TextDecoration.none
        ),
        ),
      )
    );
  }
}