import 'package:flutter/material.dart';
import 'package:time6_7/app2/model/shop.dart';
import 'package:time6_7/app2/pages/check_out_page.dart';

class CartPage extends StatefulWidget {
  final List<Shop> cartItems;
  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<Shop, int> itemCounts = {};

  @override
  void initState() {
    super.initState();
    for (var item in widget.cartItems) {
      itemCounts[item] = (itemCounts[item] ?? 0) + 1;
    }
  }

  double calculateTotal() {
    double total = 0;
    itemCounts.forEach((item, count) {
      total += item.price * count;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: itemCounts.length,
              itemBuilder: (context, index) {
                final product = itemCounts.keys.elementAt(index);
                final quantity = itemCounts[product]!;
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Image.asset(product.image,
                        width: 60, height: 60, fit: BoxFit.cover),
                    title: Text(product.name),
                    subtitle: Text("IDR ${product.price.toStringAsFixed(3)}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (itemCounts[product]! > 1) {
                                itemCounts[product] = itemCounts[product]! - 1;
                              } else {
                                itemCounts.remove(product);
                              }
                            });
                          },
                        ),
                        Text(quantity.toString()),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              itemCounts[product] = itemCounts[product]! + 1;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              itemCounts.remove(product);
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
            decoration: BoxDecoration(
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
                    Text("IDR ${calculateTotal().toStringAsFixed(3)}"),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
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
                    Text("IDR ${(calculateTotal() + 10000).toStringAsFixed(3)}",
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
