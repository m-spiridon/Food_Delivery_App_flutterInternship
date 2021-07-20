import 'package:flutter/material.dart';
import 'package:internship_project_1/components/tabs_widgets.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/single_recipe/widgets/recipe_ingredients.dart';
import 'package:internship_project_1/screens/single_recipe/widgets/recipe_instruction.dart';

class RecipeBar extends StatefulWidget {
  final productsList;
  final recipeInstructions;

  RecipeBar({this.productsList, this.recipeInstructions});

  @override
  _RecipeBarState createState() => new _RecipeBarState();
}

class _RecipeBarState extends State<RecipeBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabsDivider(),
        RecipeTab(
            title: S.of(context).recipeIngredients,
            navigateTo: IngredientsScreen(productsList: widget.productsList)),
        TabsDivider(),
        RecipeTab(
            title: S.of(context).recipeInstructions,
            navigateTo: RecipeInstruction(
                recipeInstructions: widget.recipeInstructions)),
        TabsDivider(),
      ],
    );
  }
}
