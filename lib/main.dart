import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time6_7/app3/pages/page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: Page1());
  }
}
