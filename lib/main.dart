import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time6_7/app4/screens/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: OnBoardingScreen());
  }
}
