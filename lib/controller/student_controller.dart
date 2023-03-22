import '../model/student.dart';

class StudentController {
  List<Student> _students = [
    Student(fullName: "Duc Dat", yearOfBirth: 2003, gender: "Nam"),
    Student(fullName: "Thu Mai", yearOfBirth: 2002, gender: "Nu"),
    Student(fullName: "Dinh Quang", yearOfBirth: 2001, gender: "Nam"),
  ];

  List<Student> get students => _students;

  void addStudent(Student student) {
    _students.add(student);
  }

  void deleteStudent(Student student) {
    _students.remove(student);
  }

  void editStudent(Student oldStudent, Student newStudent) {
    int index = _students.indexOf(oldStudent);
    _students[index] = newStudent;
  }

  List<Student> searchStudent(String name) {
    return students
        .where((student) => student.fullName.contains(name))
        .toList();
  }

  void sortStudent() {
    students.sort((a, b) => a.fullName.compareTo(b.fullName));
  }
}
