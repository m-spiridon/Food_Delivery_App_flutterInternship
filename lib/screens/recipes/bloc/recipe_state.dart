import 'package:flutter/foundation.dart';
import 'package:internship_project_1/screens/recipes/models/recipe.dart';

abstract class RecipeState {}

class RecipeLoadingState extends RecipeState {}

class RecipeLoadSuccessState extends RecipeState {
  List<Recipe> loadedRecipes;
  RecipeLoadSuccessState({@required this.loadedRecipes})
      : assert(loadedRecipes != null);
}

class RecipeErrorState extends RecipeState {}
