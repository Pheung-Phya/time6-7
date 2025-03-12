import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time6_7/app3/controllers/student_controller.dart';
import 'package:time6_7/app3/models/student.dart';

class StudentInput extends StatelessWidget {
  final Student? student;
  int? index;
  StudentInput({super.key, this.index, this.student});

  TextEditingController controllerId = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerGender = TextEditingController();
  TextEditingController controllerAverage = TextEditingController();

  final controller = Get.find<StudentController>();

  @override
  Widget build(BuildContext context) {
    if (student != null) {
      controllerId.text = student!.id.toString();
      controllerName.text = student!.name;
      controllerGender.text = student!.gender;
      controllerAverage.text = student!.average.toString();
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              controller: controllerId,
              decoration: const InputDecoration(
                labelText: 'ID',
              ),
            ),
            TextField(
              controller: controllerName,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: controllerGender,
              decoration: const InputDecoration(
                labelText: 'Gender',
              ),
            ),
            TextField(
              controller: controllerAverage,
              decoration: const InputDecoration(
                labelText: 'Average',
              ),
            ),
            student == null
                ? TextButton(
                    onPressed: () {
                      controller.insert(Student(
                          id: int.parse(controllerId.text),
                          name: controllerName.text,
                          gender: controllerGender.text,
                          average: double.parse(controllerAverage.text)));
                      Get.back();
                    },
                    child: const Text('Save'))
                : TextButton(
                    onPressed: () {
                      controller.Update(
                          index!,
                          Student(
                              id: int.parse(controllerId.text),
                              name: controllerName.text,
                              gender: controllerGender.text,
                              average: double.parse(controllerAverage.text)));
                      Get.back();
                    },
                    child: const Text('Update')),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Cancel'))
          ],
        ),
      ),
    );
  }
}
