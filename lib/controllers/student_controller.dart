import 'package:flutter/foundation.dart';
import 'package:flutter_provider/models/student_model.dart';

import 'package:flutter/material.dart';

class StudentController with ChangeNotifier {
  final List<StudentModel> _studentList = [];
  List<StudentModel> get getStudentList => _studentList;
  void addNewStudent(StudentModel newStudent) {
    _studentList.add(newStudent);
    notifyListeners();
  }

  void updateStudent(StudentModel updatedStudent) {
    int editedIndex =
        _studentList.indexWhere((student) => student.id == updatedStudent.id);
    _studentList[editedIndex] = updatedStudent;
    notifyListeners();
  }

  void deleteStudent([int? studentId]) {
    int deletedIndex =
        _studentList.indexWhere((student) => student.id == student.id);
    _studentList.removeAt(deletedIndex);
  }

  StudentModel filterStudent(int studentId) {
    int filteredIndex =
        _studentList.indexWhere((student) => student.id == studentId);
    return _studentList[filteredIndex];
  }
}
