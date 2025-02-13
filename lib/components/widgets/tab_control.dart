import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TabControl extends StatelessWidget {
  TabControl({super.key});

  CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Controller'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: TabBarView(children: [
          Container(
              width: double.infinity,
              color: Colors.blue,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.red,
                    child: CarouselSlider(
                        items: [
                          Image.asset(
                            'assets/food.png',
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            'assets/food.png',
                            fit: BoxFit.fill,
                          ),
                        ],
                        options: CarouselOptions(
                          initialPage: 2,
                          autoPlay: true,
                          aspectRatio: 0.9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                        )),
                  ),
                ],
              )),
          Container(
              width: double.infinity,
              color: Colors.orange,
              child: CarouselSlider.builder(
                itemCount: 15,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                  child: Text(itemIndex.toString()),
                ),
                options: CarouselOptions(),
              )),
          Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 0, 255, 26),
              child: Column(children: <Widget>[
                CarouselSlider(
                  items: [
                    Image.asset(
                      'assets/food.png',
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      'assets/food.png',
                      fit: BoxFit.fill,
                    ),
                  ],
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                TextButton(
                  onPressed: () => buttonCarouselController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear),
                  child: Text('→'),
                )
              ])),
        ]),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 2,
            selectedItemColor: Colors.red,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Setting'),
            ]),
      ),
    );
  }
}
