import 'package:flutter/material.dart';
import 'package:ql_sinhvien/controller/student_controller.dart';
import 'view/student-list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = StudentController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentList(
        controller: controller,
      ),
    );
  }
}
