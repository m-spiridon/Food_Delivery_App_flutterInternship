import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/shared/constants.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          S.of(context).cartIsEmpty,
          style: TextStyle(
            color: secondaryColor,
            fontSize: 16.0,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Image(
            fit: BoxFit.fitWidth,
            image: AssetImage('images/empty_cart.png'),
          ),
        ),
      ],
    );
  }
}
