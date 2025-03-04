import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Delivery Address
            const Text("Delivery Address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.brown),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text("123 Main Street, Jakarta",
                        style: TextStyle(fontSize: 14, color: Colors.black87)),
                  ),
                  const Icon(Icons.edit, color: Colors.brown),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Section: Order Summary
            const Text("Order Summary",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _orderItem("Black Forest Cake", "assets/cake.png", 210000, 1),
                  _orderItem("Choco Cupcake", "assets/cupcake.png", 60000, 3),
                  _orderItem("Milk Toast Bread", "assets/bread.png", 40000, 2),
                ],
              ),
            ),

            // Section: Price Breakdown
            const Divider(),
            _priceDetail("Subtotal", "IDR 310.000"),
            _priceDetail("Delivery Fee", "IDR 10.000"),
            _priceDetail("Total", "IDR 320.000", isBold: true),

            const SizedBox(height: 20),

            // Confirm and Pay Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  // Proceed to Payment Logic
                },
                child: const Text("Confirm & Pay",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget: Order Item
  Widget _orderItem(String name, String image, int price, int quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text("IDR ${price.toStringAsFixed(3)}",
                    style: const TextStyle(fontSize: 14, color: Colors.brown)),
              ],
            ),
          ),
          Text("x$quantity", style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  // Widget: Price Detail Row
  Widget _priceDetail(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
