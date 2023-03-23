import 'package:flutter/material.dart';
import 'package:ql_sinhvien/view/student_edit.dart';
import '../controller/student_controller.dart';
import '../model/student.dart';
import 'student_add.dart';

class StudentList extends StatefulWidget {
  final StudentController controller;

  StudentList({required this.controller});
  @override
  _StudentListState createState() => _StudentListState(controller: controller);
}

class _StudentListState extends State<StudentList> {
  StudentController controller;

  _StudentListState({required this.controller});

  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Management"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => setState(() {
                // search_Str = TextEditingController();
              }),
              decoration: InputDecoration(
                hintText: 'Search by name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          IconButton(
            alignment: Alignment.bottomLeft,
            onPressed: () {
              setState(() {
                var students = controller.sortStudentByName();
              });
            },
            icon: const Icon(Icons.sort_by_alpha),
          ),
          Expanded(
            child: ListView.builder(
              itemCount:
                  controller.searchStudent(_searchController.text).length,
              itemBuilder: (BuildContext context, int index) {
                var students = controller.searchStudent(_searchController.text);
                var student = students[index];
                return ListTile(
                  title: Text(student.fullName()),
                  subtitle: Text(
                      'Year of Birth: ${student.yearOfBirth}, Gender: ${student.gender}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () async {
                            Student? editStudent = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditStudent(student: student),
                              ),
                            );
                            if (editStudent != null) {
                              setState(() {
                                widget.controller
                                    .editStudent(student, editStudent);
                              });
                            }
                          }),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            controller.deleteStudent(student);
                          });
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Student? newStudent = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddStudent(),
            ),
          );
          if (newStudent != null) {
            setState(() {
              widget.controller.addStudent(newStudent);
              var students = controller.sortStudentByName();
            });
          }
        },
      ),
    );
  }
}
