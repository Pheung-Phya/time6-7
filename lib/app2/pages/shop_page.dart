import 'package:flutter/material.dart';
import 'package:time6_7/app2/controller/shop_controller.dart';
import 'package:time6_7/app2/model/shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  Category? selectedCategory;

  List<Shop>? list;

  @override
  void initState() {
    super.initState();
    filter();
  }

  void filter() {
    setState(() {
      list = controller
          .where((item) =>
              selectedCategory == item.category || selectedCategory == null)
          .toList();
    });
  }

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
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: Category.values.map((category) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 5),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            fixedSize: const Size(90, 60),
                            backgroundColor: selectedCategory == category
                                ? const Color.fromARGB(255, 148, 80, 22)
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            setState(
                              () {
                                selectedCategory = selectedCategory == category
                                    ? null
                                    : category;
                              },
                            );
                            filter();
                          },
                          child: Text(
                            category.name.toUpperCase(),
                            style: const TextStyle(color: Colors.grey),
                          )),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: list!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.lightBlue[50],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.all(5),
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    list![index].image,
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  ),
                                )),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
