import '../model/student.dart';

class StudentController {
  List<Student> students = [
    Student(surName: 'Tran Duc', name: 'Dat', yearOfBirth: 2003, gender: 'Nam'),
    Student(surName: 'Hoang Thu', name: 'Mai', yearOfBirth: 2002, gender: 'Nu'),
    Student(
        surName: 'Trinh Dinh', name: 'Quang', yearOfBirth: 2001, gender: 'Nam'),
  ];

  void addStudent(Student student) {
    students.add(student);
  }

  void deleteStudent(Student student) {
    students.remove(student);
  }

  void editStudent(Student oldStudent, Student newStudent) {
    int index = students.indexOf(oldStudent);
    students[index] = newStudent;
  }

  List<Student> searchStudent(String name) {
    return students
        .where((student) =>
            student.fullName().toLowerCase().contains(name.toLowerCase()))
        .toList();
  }

  List<Student> sortStudentByName() {
    students.sort((a, b) => a.name.compareTo(b.name));
    return students;
  }
}
