import 'package:flutter/material.dart';
import '../controller/student_controller.dart';
import '../model/student.dart';
import 'student_details.dart';
import 'student_add.dart';

class StudentList extends StatefulWidget {
  // final StudentController controller;

  // StudentList({required this.controller});
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final StudentController _controller = StudentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Management")),
      body: ListView.builder(
        itemCount: _controller.students.length,
        itemBuilder: (BuildContext context, int index) {
          Student student = _controller.students[index];
          return Card(
            child: ListTile(
              title: Text(student.fullName),
              subtitle: Text(
                  "DOB: ${student.yearOfBirth} | Gender: ${student.gender}"),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _controller.deleteStudent(student);
                  });
                },
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            StudentDetails(student: student)));
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddStudent(),
            ),
          );
        },
      ),
    );
  }
}
