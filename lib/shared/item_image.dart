 import 'package:flutter/material.dart';

Image itemImage(BuildContext context, String image) {
    return Image(
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.25,
              image: image == null
                  ? AssetImage('assets/cart_screen/default-product.jpg')
                  : NetworkImage(image),
            );
  }