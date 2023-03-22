import 'package:flutter/material.dart';
import '../model/student.dart';
import 'student_details.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key, required this.title});
  final String title;

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<Student> students = [
    Student(fullName: "Duc Dat", yearOfBirth: 2003, gender: "Nam"),
    Student(fullName: "Thu Mai", yearOfBirth: 2002, gender: "Nu"),
    Student(fullName: "Dinh Quang", yearOfBirth: 2001, gender: "Nam"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student List")),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              // leading: CircleAvatar(),
              title: Text(students[index].fullName),
              subtitle: Text(
                  "DOB: ${students[index].yearOfBirth} | Gender: ${students[index].gender}"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            StudentDetails(student: students[index])));
              },
            ),
          );
        },
      ),
    );
  }
}
