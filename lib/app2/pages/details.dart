// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:time6_7/app2/model/shop.dart';

class Details extends StatefulWidget {
  Details({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Shop product;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
