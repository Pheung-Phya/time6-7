import 'package:flutter/material.dart';
import 'package:time6_7/app2/controller/shop_controller.dart';
import 'package:time6_7/app2/model/shop.dart';

class ShowProduct extends StatefulWidget {
  const ShowProduct({super.key});

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
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
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: Category.values.map((category) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
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
                            selectedCategory =
                                selectedCategory == category ? null : category;
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
          ),
        ],
      ),
    );
  }
}
