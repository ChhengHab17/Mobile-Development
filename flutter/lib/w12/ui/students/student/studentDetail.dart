import 'package:flutter/material.dart';

class Studentdetail extends StatefulWidget {
  const Studentdetail({super.key, required this.studentId});

  final String studentId;

  @override
  State<Studentdetail> createState() => _StudentdetailState();
}

class _StudentdetailState extends State<Studentdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.studentId)),
      body: Container(
        color: Colors.red,
        child: Center(child: Text("Classroom ${widget.studentId}")),
      ),
    );
  }
}
