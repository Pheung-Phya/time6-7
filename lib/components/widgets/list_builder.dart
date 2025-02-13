import 'package:flutter/material.dart';

class ListBuilder extends StatelessWidget {
  ListBuilder({super.key});

  List<String> image = [
    'https://th.bing.com/th/id/OIP.O106UdJ2Eo2K9dBSwh3vHgHaEK?w=333&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'https://th.bing.com/th/id/OIP.O106UdJ2Eo2K9dBSwh3vHgHaEK?w=333&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'https://th.bing.com/th/id/OIP.O106UdJ2Eo2K9dBSwh3vHgHaEK?w=333&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'https://th.bing.com/th/id/OIP.O106UdJ2Eo2K9dBSwh3vHgHaEK?w=333&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'https://th.bing.com/th/id/OIP.O106UdJ2Eo2K9dBSwh3vHgHaEK?w=333&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'https://th.bing.com/th/id/OIP.O106UdJ2Eo2K9dBSwh3vHgHaEK?w=333&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'https://th.bing.com/th/id/OIP.O106UdJ2Eo2K9dBSwh3vHgHaEK?w=333&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'https://th.bing.com/th/id/OIP.O106UdJ2Eo2K9dBSwh3vHgHaEK?w=333&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'https://th.bing.com/th/id/OIP.O106UdJ2Eo2K9dBSwh3vHgHaEK?w=333&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'https://th.bing.com/th/id/OIP.O106UdJ2Eo2K9dBSwh3vHgHaEK?w=333&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('List Builder'),
      ),
      body: ListView.builder(
          itemCount: image.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(image[index])),
                color: index % 2 == 0 ? Colors.green : Colors.red,
              ),
            );
          }),
    );
  }
}
