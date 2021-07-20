import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/models/cart_item.dart';
import 'package:internship_project_1/screens/cart_screen/bloc/cart_bloc.dart';
import 'package:internship_project_1/screens/cart_screen/bloc/cart_event.dart';
import 'package:internship_project_1/shared/constants.dart';

class CartItemCard extends StatefulWidget {
  final int id;
  final String name;
  final String price;
  final String image;
  final int quantity;

  CartItemCard({this.id, this.name, this.price, this.image, this.quantity});
  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  _itemQuantity(context, cartBloc) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: () {
              cartBloc.add(
                CartDeleteItemEvent(widget.id),
              );
            },
            icon: Image(
              height: 28.0,
              image: AssetImage('images/minus_button.png'),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5.0,
            ),
            child: Text(
              widget.quantity.toString(),
              style: TextStyle(
                color: secondaryColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: () {
              cartBloc.add(
                CartAddItemEvent(
                  CartItem(
                    productId: widget.id,
                    quantity: 1,
                  ),
                ),
              );
            },
            icon: Image(
              height: 28.0,
              fit: BoxFit.fitHeight,
              image: AssetImage(
                'images/plus_button.png',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    double finalPrice = double.parse(widget.price) * widget.quantity;
    finalPrice = double.parse(finalPrice.toStringAsFixed(2));

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      margin: EdgeInsets.only(bottom: 20.0),
      height: MediaQuery.of(context).size.height * 0.2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          margin: EdgeInsets.all(14.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                        image: widget.image == null
                            ? AssetImage(
                                'assets/cart_screen/default-product.jpg')
                            : NetworkImage(widget.image),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 8.0,
                        ),
                        child: Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).currency + finalPrice.toString(),
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            _itemQuantity(
                              context,
                              cartBloc,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
