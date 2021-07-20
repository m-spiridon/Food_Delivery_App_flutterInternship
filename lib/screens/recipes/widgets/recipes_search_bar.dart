import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/screens/recipes/bloc/recipe_bloc.dart';
import 'package:internship_project_1/screens/recipes/widgets/search_bar.dart';

class RecipesSearch extends StatelessWidget {
  const RecipesSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RecipeBloc recipeBloc = BlocProvider.of<RecipeBloc>(context);
    return SearchBar(fromScreen: FromScreen.recipes, bloc: recipeBloc);
  }
}
