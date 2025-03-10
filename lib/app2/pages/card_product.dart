import 'package:flutter/material.dart';
import 'package:time6_7/app2/controller/cart_controller.dart';
import 'package:time6_7/app2/model/shop.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({super.key});

  @override
  State<CartProduct> createState() => _CartPageState();
}

class _CartPageState extends State<CartProduct> {
  List<Shop> list = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      list = CartController.cart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Image.asset(list[index].image,
                        width: 60, height: 60, fit: BoxFit.cover),
                    title: Text(list[index].name),
                    subtitle:
                        Text("IDR ${list[index].price.toStringAsFixed(3)}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (list[index].qty > 1) {
                                list[index].qty = list[index].qty - 1;
                              } else {
                                CartController.cart.removeAt(index);
                              }
                            });
                          },
                        ),
                        Text(list[index].qty.toString()),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              list[index].qty = list[index].qty + 1;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              CartController.cart.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 10, spreadRadius: 2)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total items"),
                    Text(
                        "IDR ${list.fold(0.0, (sum, item) => sum + (item.qty * item.price)).toStringAsFixed(2)}"),
                  ],
                ),
                const SizedBox(height: 5),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery fee"),
                    Text("IDR 10.000"),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                        "IDR ${(list.fold(0.0, (sum, item) => sum + (item.qty * item.price)) + 10).toStringAsFixed(3)}",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {},
                    child: const Text("Check out",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
