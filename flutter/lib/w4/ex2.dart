import 'package:flutter/material.dart';

void main() {
  runApp
  (MaterialApp
    (
      home: Container(
        color: Colors.blue[300],
        padding: EdgeInsets.all(50.0),
        margin: EdgeInsets.all(40.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[600],
            borderRadius: BorderRadius.circular(10),
          ),
        child: Center(
          child: Text('CADT Student',
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            decoration: TextDecoration.none
          )
          ),
          )
        )

      )
    )
  );
}