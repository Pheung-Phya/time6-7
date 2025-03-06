// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:time6_7/app2/controller/like_controller.dart';
import 'package:time6_7/app2/model/like.dart';

import 'package:time6_7/app2/model/shop.dart';
import 'package:time6_7/app2/pages/card.dart';

class Details extends StatefulWidget {
  const Details({
    Key? key,
    required this.shop,
  }) : super(key: key);
  final Shop shop;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int _count = 1;
  LikeEnum _like = LikeEnum.normal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
            ),
            Positioned(
              child: Container(
                height: 450,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.shop.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new))),
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              bool isAlreadyLiked = LikeController.like
                                  .any((item) => item.id == widget.shop.id);

                              if (!isAlreadyLiked) {
                                LikeController.like.add(widget.shop);
                              }
                            });
                          },
                          icon: const Icon(Icons.favorite_border_rounded))),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 450,
                decoration: const BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.shop.name),
                    Text(widget.shop.description),
                    Text('IDR ${widget.shop.price.toStringAsFixed(3)}'),
                    const Text('Size'),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: DropdownButton(
                          hint: const Text('Select size'),
                          borderRadius: BorderRadius.circular(10),
                          items: widget.shop.size.map((item) {
                            return DropdownMenuItem<String>(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (value) {}),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          width: 70,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '$_count',
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                height: 50,
                                child: Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            _count++;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.arrow_drop_up_sharp,
                                          size: 25,
                                        )),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            _count = _count > 1 ? --_count : 1;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.arrow_drop_down_sharp,
                                          size: 25,
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor:
                                        const Color.fromARGB(255, 148, 80, 22)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CartPage(
                                              cartItems: [widget.shop])));
                                },
                                child: const Text('Add to Cart')),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
