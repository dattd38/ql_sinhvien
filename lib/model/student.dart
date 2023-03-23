class Student {
  String surName;
  String name;
  int yearOfBirth;
  String gender;

  Student(
      {required this.name,
      required this.surName,
      required this.yearOfBirth,
      required this.gender});

  String fullName() {
    String fullName = surName + ' ' + name;
    return fullName;
  }
}
