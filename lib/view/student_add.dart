import 'package:flutter/material.dart';
import 'package:ql_sinhvien/model/student.dart';

import '../controller/student_controller.dart';

class AddStudent extends StatelessWidget {
  final StudentController _controller = StudentController();
  final nameController = TextEditingController();
  final yearController = TextEditingController();
  final genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: Card(
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: 'Full name'),
              ),
            ),
            Expanded(
              child: TextField(
                controller: yearController,
                decoration: InputDecoration(hintText: 'Year of birth'),
              ),
            ),
            Expanded(
              child: TextField(
                controller: genderController,
                decoration: InputDecoration(hintText: 'Gender'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                final student = Student(
                    fullName: nameController.text,
                    yearOfBirth: int.parse(yearController.text),
                    gender: genderController.text);
                _controller.addStudent(student);
                nameController.clear();
                yearController.clear();
                genderController.clear();
              },
            )
          ],
        ),
      ),
    );
  }
}
