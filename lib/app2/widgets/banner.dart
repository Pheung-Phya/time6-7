import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa41zfyiH6IbDPFH7tpBsb5aJw4BjKBHz8QA&s'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Get Special Discount',
            style: TextStyle(
              color: Color.fromARGB(255, 141, 105, 105),
              fontSize: 20,
            ),
          ),
          const Text(
            'Up to 50%',
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 148, 80, 22),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text('Buy Now', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
