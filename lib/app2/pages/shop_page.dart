import 'package:flutter/material.dart';
import 'package:time6_7/app2/widgets/banner.dart';
import 'package:time6_7/app2/widgets/show_product.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        margin: const EdgeInsets.only(top: 60),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [Banners(), ShowProduct()],
          ),
        ),
      ),
    );
  }
}
