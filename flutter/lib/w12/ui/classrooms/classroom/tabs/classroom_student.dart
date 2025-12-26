import 'package:flutter/material.dart';

class ClassroomStudent extends StatelessWidget {
  const ClassroomStudent({super.key, required this.classroomId});
  final String classroomId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue[400],
        child: Center(child: Text("Classroom student $classroomId")),
      ),
    );
  }
}