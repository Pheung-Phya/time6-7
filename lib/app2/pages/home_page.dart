import 'package:flutter/material.dart';
import 'package:time6_7/app2/pages/card_product.dart';
import 'package:time6_7/app2/pages/like_page.dart';
import 'package:time6_7/app2/pages/profile.dart';
import 'package:time6_7/app2/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  var _WidgetList = [ShopPage(), LikePage(), CartProduct(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _WidgetList[index],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Home')
          ]),
    );
  }
}
