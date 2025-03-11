import 'package:get/get.dart';
import 'package:time6_7/app3/models/student.dart';

class StudentController extends GetxController {
  var students = [
    Student(id: 101, name: "Panha", gender: "Male", average: 90.90),
    Student(id: 102, name: "Thida", gender: "Female", average: 80.90),
    Student(id: 103, name: "Tola", gender: "Male", average: 70.90),
  ].obs;

  void insert(Student student) {
    students.add(student);
  }
}
