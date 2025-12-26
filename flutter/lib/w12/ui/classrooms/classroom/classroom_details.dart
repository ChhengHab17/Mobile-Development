import 'package:first_app/w12/ui/classrooms/classroom/tabs/classroom_assignment.dart';
import 'package:flutter/material.dart';

import 'tabs/classroom_feed.dart';
import 'tabs/classroom_student.dart';

class ClassroomDetails extends StatefulWidget {
  const ClassroomDetails({super.key, required this.classroomId});

  final String classroomId;

  @override
  State<ClassroomDetails> createState() => _ClassroomDetailsState();
}

enum ClassroomTab { feedTab, studentsTab, assigmentTab }

class _ClassroomDetailsState extends State<ClassroomDetails> {
  ClassroomTab _currentTab = ClassroomTab.feedTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Classroom ${widget.classroomId}')),
      body: IndexedStack(
        index: _currentTab.index,
        children: [
          ClassroomFeed(classroomId: widget.classroomId),
          ClassroomStudent(classroomId: widget.classroomId),
          ClassroomAssignment(classroomId: widget.classroomId)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab.index,
        selectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            _currentTab = ClassroomTab.values[index];
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people), 
            label: 'Students'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: "Assigment"
          )
         
        ],
      ),
    );
  }
}