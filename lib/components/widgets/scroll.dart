import 'package:flutter/material.dart';

class Scroll extends StatelessWidget {
  const Scroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        for (int i = 1; i <= 100; i++)
          Container(
            height: 100,
            color: i % 2 == 0 ? Colors.red : Colors.blue,
            child: Center(
              child: Text('$i'),
            ),
          ),
      ],
    ));
  }
}
