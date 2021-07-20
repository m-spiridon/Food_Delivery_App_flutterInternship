import 'package:flutter/material.dart';

class Group {
  String name;
  List products;

  Group({
    @required this.name,
    @required this.products,
  });

  int get itemsCount {
    return products.length;
  }
}
