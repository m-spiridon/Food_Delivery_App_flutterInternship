import 'package:flutter/material.dart';
import 'package:internship_project_1/screens/single_recipe/single_recipe_screen.dart';
import 'package:internship_project_1/screens/recipes/widgets/recipe_image.dart';
import 'package:internship_project_1/screens/recipes/widgets/recipe_info.dart';

class RecipeCard extends StatelessWidget {
  final id;
  final name;
  final image;
  final timeToCook;
  final price;
  final portions;
  final portionSize;
  final description;

  const RecipeCard(
      {Key key,
      this.id,
      this.name,
      this.image,
      this.timeToCook,
      this.price,
      this.portions,
      this.portionSize,
      this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        color: Colors.white,
      ),
      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 10.0),
      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      height: MediaQuery.of(context).size.height * 0.4,
      child: InkWell(
        child: Column(
          children: [
            Expanded(flex: 2, child: RecipeImage(image: image)),
            Expanded(
              flex: 1,
              child: RecipeInfo(
                name: name,
                timeToCook: timeToCook,
                portions: portions,
                price: price,
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleRecipeScreen(
                      title: name,
                      id: id,
                    )),
          );
        },
      ),
    );
  }
}
