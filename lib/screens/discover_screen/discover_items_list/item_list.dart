import 'package:flutter/material.dart';
import 'package:internship_project_1/components/single_product_card.dart';
import 'package:internship_project_1/screens/product_screen/recipe_single_product_item.dart';
import 'package:internship_project_1/screens/products/products_data.dart';

class ItemListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                child: SingleProductCard(
                  id: products[index]['id'],
                  title: products[index]['title'],
                  subtitle: products[index]['subtitle'],
                  amount: products[index]['amount'],
                  price: products[index]['price'],
                  image: products[index]['image'],
                  isHorizontal: false,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SingleProduct(
                              id: products[index]['id'],
                            )));
              });
        },
      ),
    );
  }
}
