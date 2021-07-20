import 'package:flutter/foundation.dart';
import 'package:internship_project_1/screens/recipes/models/recipe.dart';

abstract class SingleRecipeState {}

class SingleRecipeLoadingState extends SingleRecipeState {}

class SingleRecipeLoadState extends SingleRecipeState {
  Recipe loadedRecipe;
  SingleRecipeLoadState({@required this.loadedRecipe})
      : assert(loadedRecipe != null);
}

class SingleRecipeLoadSuccessState extends SingleRecipeState {
  Recipe loadedRecipe;
  SingleRecipeLoadSuccessState({@required this.loadedRecipe})
      : assert(loadedRecipe != null);
}

class SingleRecipeErrorState extends SingleRecipeState {}
