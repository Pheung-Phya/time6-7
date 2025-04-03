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

  void onPageSkip() {
    currentPage.value = 2;
    pageController.jumpToPage(2);
  }

  void onPageChanged(index) {
    currentPage.value = index;
  }

  void pageNext() {
    if (currentPage.value == 2) {
      // Get.offAll('');
    } else {
      currentPage.value++;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }
}
