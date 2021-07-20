import 'package:flutter/material.dart';
import 'package:internship_project_1/components/single_product_card.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/order_summary/order_summary_screen.dart';
import 'package:internship_project_1/screens/products/products_data.dart';
import 'package:internship_project_1/shared/colors.dart';

class YouMightLikeBody extends StatelessWidget {
  Widget _categoryName(String name, context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.0,
        left: 15.0,
      ),
      child: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
    );
  }

  Widget _subcategoryName(String name, context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8.0,
        left: 15.0,
      ),
      child: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _categoryItems(context, categoryProducts) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categoryProducts
            .map<Widget>((it) => SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: SingleProductCard(
                    id: it['id'],
                    title: it['title'],
                    subtitle: it['subtitle'],
                    amount: it['amount'],
                    price: it['price'],
                    image: it['image'],
                    isHorizontal: true,
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _continueButton(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      color: Colors.white,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderSummaryScreen(),
            ),
          );
        },
        style: TextButton.styleFrom(
            backgroundColor: orange,
            padding: EdgeInsets.symmetric(vertical: 10.0)),
        child: Text(
          S.of(context).youMightLikeContinueButtonText,
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _categoryName(
                    S.of(context).youMightLikeBeforeYouGoCategory, context),
                _categoryItems(context, products.reversed),
                _categoryName(
                    S.of(context).youMightLikeBecauseYouLikeCategory, context),
                _subcategoryName(products[0]['title'], context),
                _categoryItems(context, products.reversed),
                _subcategoryName(products[3]['title'], context),
                _categoryItems(context, products),
              ],
            ),
          ),
        ),
        _continueButton(context),
      ],
    );
  }
}
