import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/shared/constants.dart';

class CartPaymentInfo extends StatelessWidget {
  final double total;

  const CartPaymentInfo({Key key, this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).basketTotal,
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 13.0,
                  ),
                ),
                Text(
                  S.of(context).currency + total.toStringAsFixed(2),
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).deliveryCalculatedAtCheckout,
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              S.of(context).addPromoCodeOrGiftCard,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).subTotal,
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  S.of(context).currency + total.toStringAsFixed(2),
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
