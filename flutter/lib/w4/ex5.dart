import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(40),
      color: Colors.grey[300],
      child: Column(
        children: [
          CustomWidget(text: 'OPP', color: Colors.blue[100]),
          CustomWidget(text: 'DART', color: Colors.blue[300]),
          CustomWidget(text: 'FLUTTER', color: Colors.blue[600]),
        ],
      ),
    ),
  ));
}

class CustomWidget extends StatelessWidget {
  final String text;
  final Color? color;
  const CustomWidget({
    super.key,
    required this.text,
    this. color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(
          horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: Colors.white, decoration: TextDecoration.none),
      )
      ),
    );
  }
}