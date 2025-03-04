import 'package:flutter/material.dart';
import 'package:time6_7/app2/controller/shop_controller.dart';
import 'package:time6_7/app2/model/shop.dart';
import 'package:time6_7/app2/pages/details.dart';

class ShowProduct extends StatefulWidget {
  const ShowProduct({super.key});

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  Category? selectedCategory;
  List<Shop>? list;
  TextEditingController search = TextEditingController();

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

  void fillList() {
    setState(() {
      list = controller
          .where((item) =>
              item.name.toLowerCase().contains(search.text.toLowerCase()))
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
            alignment: Alignment.center,
            height: 40,
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: search,
                  onChanged: (value) {
                    fillList();
                  },
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
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
            margin: const EdgeInsets.only(bottom: 5),
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                    shop: list![index],
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.lightBlue[50],
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
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
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(list![index].name),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                                "IDR ${list![index].price.toStringAsFixed(3)}"),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 50,
                                height: 40,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 148, 80, 22),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: const Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
