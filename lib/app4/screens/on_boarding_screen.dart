import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final controller = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            children: const [
              OnBoardingPage(
                  title: 'Page 1',
                  subTitle: 'This is page 1.',
                  image: "assets/food.png"),
              OnBoardingPage(
                  title: 'Page 2',
                  subTitle: 'This is page 2.',
                  image: "assets/food.png"),
              OnBoardingPage(
                  title: 'Page 3',
                  subTitle: 'This is page 3.',
                  image: "assets/food.png"),
            ],
          ),
          Positioned(
            bottom: 60,
            left: 20,
            child: SmoothPageIndicator(
              controller: controller.pageController,
              onDotClicked: controller.onPageNavigationClick,
              count: 3,
              effect: const WormEffect(
                  dotWidth: 20,
                  dotHeight: 10,
                  activeDotColor: Colors.blue), // your preferred effect
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    this.image,
    this.title,
    this.subTitle,
  });

  // ignore: prefer_typing_uninitialized_variables
  final image, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(image)),
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          Text(subTitle, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
