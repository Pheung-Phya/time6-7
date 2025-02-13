import 'package:flutter/material.dart';

class TestStack extends StatelessWidget {
  const TestStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Container(
            width: 500,
            height: 500,
            color: Colors.amber,
            child: Image.asset(
              "assets/ganzberg.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 10,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.pink,
                  size: 32,
                )),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.red),
              child: Image.asset('assets/food.png'),
            ),
          ),
          Positioned(
            child: Container(
              width: 100,
              height: 100,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
