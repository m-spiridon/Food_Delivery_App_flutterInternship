import 'package:flutter/material.dart';
import 'package:internship_project_1/components/single_product_card.dart';

class ProductList extends StatelessWidget {
  final title;
  final products;
  final totalPrice;

  ProductList(
      {@required this.title,
      @required this.products,
      @required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return SingleProductCard(
              id: products[index]['id'],
              title: products[index]['title'],
              price: products[index]['price'],
              image: products[index]['image'],
              amount: products[index]['amount'],
              isHorizontal: true,
            );
          }),
    );
  }
}
