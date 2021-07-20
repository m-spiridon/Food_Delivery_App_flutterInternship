import 'package:flutter/material.dart';
import 'package:internship_project_1/screens/cart_screen/widgets/cart_body.dart';
import 'package:internship_project_1/shared/constants.dart';

class CartScreen extends StatelessWidget {
  static const String id = 'cart_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Your basket',
          style: TextStyle(
              color: secondaryColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Container(
        color: backgroundColor,
        width: MediaQuery.of(context).size.width,
        child: CartBody(),
      ),
    );
  }
}
