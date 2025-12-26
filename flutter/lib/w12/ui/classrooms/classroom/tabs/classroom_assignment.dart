import 'package:flutter/material.dart';

class ClassroomAssignment extends StatelessWidget {
  const ClassroomAssignment({super.key, required this.classroomId});

  final String classroomId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        child: Center(child: Text("Classroom Assignment $classroomId")),
      ),
    );
  }
}