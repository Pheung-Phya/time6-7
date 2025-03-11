import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time6_7/app3/controllers/student_controller.dart';
import 'package:time6_7/app3/models/student.dart';

class StudentInput extends StatelessWidget {
  StudentInput({super.key});

  TextEditingController controllerId = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerGender = TextEditingController();
  TextEditingController controllerAverage = TextEditingController();

  final controller = Get.find<StudentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              controller: controllerId,
              decoration: InputDecoration(
                labelText: 'ID',
              ),
            ),
            TextField(
              controller: controllerName,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: controllerGender,
              decoration: InputDecoration(
                labelText: 'Gender',
              ),
            ),
            TextField(
              controller: controllerAverage,
              decoration: InputDecoration(
                labelText: 'Average',
              ),
            ),
            TextButton(
                onPressed: () {
                  controller.insert(Student(
                      id: int.parse(controllerId.text),
                      name: controllerName.text,
                      gender: controllerGender.text,
                      average: double.parse(controllerAverage.text)));
                  Get.back();
                },
                child: Text('Save'))
          ],
        ),
      ),
    );
  }
}
