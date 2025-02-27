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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Banners(),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                alignment: Alignment.center,
                height: 40,
                child: Row(
                  children: [
                    const Expanded(
                        child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: 40,
                      height: 40,
                      color: Colors.amber,
                    )
                  ],
                ),
              ),
              const ShowProduct()
            ],
          ),
        ),
      ),
    );
  }
}
