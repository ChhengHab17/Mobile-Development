import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(40),
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
           color: Colors.red,
           child: Text('Hello 1', style: TextStyle(color: Colors.white)),
          ),
          Container(
            color: Colors.blue,
           child: Text('Hello 2', style: TextStyle(color: Colors.white)),
          ),
          Container(
            color: Colors.green[200],
           child: Text('Hello 3', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    ),
  ));
}