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
              return Card(
                child: ListTile(
                    leading: Text(controller.students[index].id.toString()),
                    title: Text(controller.students[index].name.toString()),
                    subtitle:
                        Text(controller.students[index].gender.toString()),
                    trailing: SizedBox(
                      width: 120,
                      child: Row(
                        children: [
                          Text(controller.students[index].average.toString()),
                          IconButton(
                            onPressed: () {
                              controller.deleteIndex(index);
                            },
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                          ),
                          IconButton(
                            onPressed: () {
                              Get.to(StudentInput(
                                index: index,
                                student: controller.students[index],
                              ));
                            },
                            icon: const Icon(Icons.edit),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    )),
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
