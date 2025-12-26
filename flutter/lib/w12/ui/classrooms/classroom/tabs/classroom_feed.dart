import 'package:flutter/material.dart';

class ClassroomFeed extends StatelessWidget {
  const ClassroomFeed({super.key, required this.classroomId});

  final String classroomId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.green[600],
        child: Center(child: Text("Feed classroom $classroomId")),
      ),
    );
  }
}