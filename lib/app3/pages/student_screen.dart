import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time6_7/app3/controllers/student_controller.dart';
import 'package:time6_7/app3/pages/student_input.dart';

class StudentScreen extends StatelessWidget {
  StudentScreen({super.key});

  StudentController controller = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: Center(
          child: Obx(
        () => ListView.builder(
            itemCount: controller.students.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(controller.students[index].id.toString()),
                title: Text(controller.students[index].name.toString()),
                subtitle: Text(controller.students[index].gender.toString()),
                trailing: Text(controller.students[index].average.toString()),
              );
            }),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(StudentInput());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
