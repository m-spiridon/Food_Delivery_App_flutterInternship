import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/screens/recipes/services/recipe_api_client.dart';
import 'package:internship_project_1/screens/single_recipe/bloc/single_recipe_bloc.dart';
import 'package:internship_project_1/screens/single_recipe/widgets/single_recipe_body.dart';

class SingleRecipeScreen extends StatelessWidget {
  final id;
  final title;
  final recipeClient = RecipeClient();

  SingleRecipeScreen({Key key, this.id, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SingleRecipeBloc>(
      create: (context) => SingleRecipeBloc(recipeClient),
      child: Scaffold(
        body: SingleRecipeBody(
          id: id,
        ),
      ),
    );
  }
}
