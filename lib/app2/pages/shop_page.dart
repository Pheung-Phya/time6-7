import 'package:flutter/material.dart';
import 'package:time6_7/app2/model/shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  Category? selectedCategory;

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
              Container(
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
                          child: Text('Buy Now',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
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
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: Category.values.map((name) {
                    return TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: selectedCategory == name
                                ? const Color.fromARGB(255, 148, 80, 22)
                                : Colors.white),
                        onPressed: () {
                          setState(() {
                            selectedCategory =
                                selectedCategory == name ? null : name;
                          });
                        },
                        child: Text(
                          name.name.toUpperCase(),
                          style: const TextStyle(color: Colors.grey),
                        ));
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}






    //  SizedBox(
    //             height: 50,
    //             child: ListView(
    //               scrollDirection: Axis.horizontal,
    //               children: Category.values.map((category) {
    //                 return Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //                   child: TextButton(
    //                     style: TextButton.styleFrom(
    //                       padding: const EdgeInsets.symmetric(horizontal: 16),
    //                       backgroundColor: selectedCategory == category
    //                           ? Colors.orange
    //                           : Colors.grey.shade200,
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(20),
    //                       ),
    //                     ),
    //                     onPressed: () {
    //                       setState(() {
    //                         selectedCategory =
    //                             selectedCategory == category ? null : category;
    //                       });
    //                     },
    //                     child: Text(
    //                       category.name.toUpperCase(),
    //                       style: TextStyle(
    //                         color: selectedCategory == category
    //                             ? Colors.white
    //                             : Colors.black,
    //                         fontWeight: FontWeight.w500,
    //                       ),
    //                     ),
    //                   ),
    //                 );
    //               }).toList(),
    //             ),
    //           ),

    //           Expanded(
    //             child: ListView(
    //               children: controller
    //                   .where((shop) =>
    //                       selectedCategory == null ||
    //                       shop.category == selectedCategory)
    //                   .map((shop) => ListTile(
    //                         leading: Image.asset(shop.image, width: 50),
    //                         title: Text(shop.name),
    //                         subtitle: Text('\$${shop.price}'),
    //                       ))
    //                   .toList(),
    //             ),
    //           ),
            