import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  Rx<int> currentPage = 0.obs;
  final pageController = PageController();

  void skipPage() {
    currentPage.value = 2;
    pageController.jumpToPage(2);
  }

  void onPageNavigationClick(index) {
    currentPage.value = index;
    pageController.jumpToPage(currentPage.value);
  }
}
