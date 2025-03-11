import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time6_7/app3/controllers/counter_controller.dart';
import 'package:time6_7/app3/pages/page2.dart';

class Page1 extends StatelessWidget {
  Page1({super.key});

  CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Page2()));

                Get.to(Page2());
              },
              icon: const Icon(Icons.arrow_right_alt_outlined))
        ],
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
