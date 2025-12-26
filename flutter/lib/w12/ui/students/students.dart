import 'package:first_app/w12/ui/students/student/studentDetail.dart';
import 'package:flutter/material.dart';

class Students extends StatelessWidget {
  const Students({super.key});

  @override
  Widget build(BuildContext context) {
    final students = [
      'Jonson',
      'Chanrat',
      'Jed',
    ];
    return Scaffold(
      appBar: AppBar(title: Text("Students")),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(student),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Studentdetail(studentId: student),
                )
                );
            },
          );
          } ,
      ),
    );
  }
}