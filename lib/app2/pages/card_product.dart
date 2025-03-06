import 'package:flutter/material.dart';
import 'package:time6_7/app2/controller/like_controller.dart';
import 'package:time6_7/app2/model/shop.dart';
import 'package:time6_7/app2/pages/details.dart';

class CardProduct extends StatefulWidget {
  const CardProduct({super.key});

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello world"),
      ),
    );
  }
}
