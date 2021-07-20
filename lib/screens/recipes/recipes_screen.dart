import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/recipes/bloc/recipe_bloc.dart';
import 'package:internship_project_1/screens/recipes/services/recipe_api_client.dart';
import 'package:internship_project_1/screens/recipes/widgets/recipe_list.dart';
import 'package:internship_project_1/screens/recipes/widgets/recipes_search_bar.dart';

class RecipesScreen extends StatelessWidget {
  static const String id = 'recipes_screen';

  RecipesScreen({Key key}) : super(key: key);

  final recipeClient = RecipeClient();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeBloc>(
      create: (context) => RecipeBloc(recipeClient),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).recipesScreenAppBarTitle,
          ),
          actions: [
            // SearchBar(FromScreen.recipes, RecipeBloc(recipeClient)),
            RecipesSearch(),
          ],
        ),
        body: RecipeList(),
      ),
    );
  }
}
