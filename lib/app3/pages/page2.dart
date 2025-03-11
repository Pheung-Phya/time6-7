import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time6_7/app3/controllers/counter_controller.dart';

class Page2 extends StatelessWidget {
  Page2({super.key});

  CounterController controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Obx(
        () => Center(
          child: Text(
            '${controller.count.value}',
            style: TextStyle(fontSize: 35),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
