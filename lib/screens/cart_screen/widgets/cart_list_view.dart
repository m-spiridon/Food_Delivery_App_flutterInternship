import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/cart_screen/widgets/cart_item_card.dart';
import 'package:internship_project_1/screens/cart_screen/widgets/cart_payment_info.dart';
import 'package:internship_project_1/screens/product_screen/product_provider.dart';
import 'package:internship_project_1/models/product_model.dart';
import 'package:internship_project_1/screens/you_might_like/you_might_like_screen.dart';
import 'package:internship_project_1/shared/constants.dart';

class CartListView extends StatelessWidget {
  final List<Product> cartItems;

  const CartListView({Key key, this.cartItems}) : super(key: key);

  _calculateTotal(List<Product> products) {
    var total = 0.0;
    for (Product product in products) {
      total += product.quantity * product.price;
    }
    return total;
  }

  _numberOfItems(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 15.0, 0.0, 15.0),
      child: Text(
        cartItems.length == 1
            ? S.of(context).singleItemInOrder
            : S.of(context).fewItemsInOrder(cartItems.length),
        style: TextStyle(
          color: secondaryColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  _getCartItemCards(context) {
    return cartItems.map((item) {
      return InkWell(
        child: CartItemCard(
          id: item.id,
          name: item.title,
          price: item.price.toString(),
          image: item.image,
          quantity: item.quantity,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductBuilder(
                        id: item.id,
                      )));
        },
      );
    }).toList();
  }

  _checkoutButton(context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 15.0,
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => YouMightLikeScreen()));
          },
          child: Text(
            S.of(context).checkout,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            backgroundColor: primaryColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              _numberOfItems(context),
              ..._getCartItemCards(context),
              CartPaymentInfo(
                total: _calculateTotal(cartItems),
              ),
            ],
          ),
        ),
        _checkoutButton(context),
      ],
    );
  }
}
