import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Hobbies')),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10.0,
            children: [
              CustomWidget(text: 'Traveling', color: Colors.green, icon: Icons.travel_explore),
              CustomWidget(text: 'Skating', color: Colors.blue, icon: Icons.skateboarding),
            ],
          )
        )
          
      
  ),
  ));
}

class CustomWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final IconData icon;
  const CustomWidget({
    super.key,
    required this.text,
    this.color = Colors.blue,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Row(
          spacing: 20.0,
          children: [
            Icon(icon, size: 40),
            Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        )
      ),
    );
  }
}