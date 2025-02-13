import 'package:flutter/material.dart';
import 'package:time6_7/app/models/product.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<String> logo = [
    'assets/photo/pumalogo.png',
    'assets/photo/abc.png',
    'assets/photo/nikelogo.png',
    'assets/photo/adidaslogo.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search_off_outlined,
                      color: Colors.orange,
                    ),
                    hintText: "Placeholder Search",
                    border: OutlineInputBorder(
                        gapPadding: 10,
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.orange,
                  ),
                ),
                const Positioned(
                    right: 10,
                    top: 12,
                    child: Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.orange,
                    ))
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              // container scroll
              Container(
                  width: double.infinity,
                  height: 70,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: logo.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              color: index == 1 ? Colors.orange : null,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(logo[index]),
                        );
                      })),
              // tittle
              const Text(
                'FIND THE BEST FIT FOR YOU...',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              //row
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Our top picks'), Icon(Icons.add)],
              ),
              //list grid
              Container(
                width: double.infinity,
                height: 500,
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.8),
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      return Container(
                          child: Column(
                        children: [
                          Container(
                              width: double.infinity,
                              height: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.8),
                                      blurRadius: 10,
                                    )
                                  ]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  product[index].photo,
                                  fit: BoxFit.fill,
                                ),
                              )),
                          Text(product[index].name)
                        ],
                      ));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
