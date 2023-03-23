import 'package:flutter/material.dart';
import '../model/student.dart';

class StudentDetails extends StatelessWidget {
  final Student student;

  const StudentDetails({required this.student});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(student.fullName())),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text("Full Name"),
              subtitle: Text(student.fullName()),
            ),
            ListTile(
              title: Text("Year of Birth"),
              subtitle: Text(student.yearOfBirth.toString()),
            ),
            ListTile(
              title: Text("Gender"),
              subtitle: Text(student.gender),
            )
          ],
        ),
      ),
    );
  }
}
