import 'package:flutter/material.dart';
import 'package:time6_7/app/models/product.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.product,
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 5),
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(product.photo), fit: BoxFit.fill)),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Information'), Icon(Icons.add)],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Select Size"),
            Row(
                children: product.size
                    .map((item) => Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 50,
                            child: Center(
                              child: Text(item),
                            ),
                          ),
                        ))
                    .toList())
          ],
        ),
      ),
    );
  }
}
