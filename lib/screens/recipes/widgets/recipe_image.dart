import 'package:flutter/material.dart';

class RecipeImage extends StatelessWidget {
  final defaultPicture =
      "https://vaya.in/recipes/wp-content/themes/neptune-by-osetin/assets/img/placeholder.jpg";
  final image;

  RecipeImage({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          image: DecorationImage(
              image: image == null
                  ? NetworkImage(defaultPicture)
                  : NetworkImage(image),
              fit: BoxFit.fitWidth)),
    );
  }
}
