import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/screens/recipes/bloc/recipe_event.dart';
import 'package:internship_project_1/screens/recipes/bloc/recipe_state.dart';
import 'package:internship_project_1/screens/recipes/models/recipe.dart';
import 'package:internship_project_1/screens/recipes/services/recipe_api_client.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeClient recipeClient;
  RecipeBloc(this.recipeClient) : super(RecipeLoadingState());

  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    if (event is RecipeLoadEvent) {
      try {
        final List<Recipe> _loadedRecipeList =
            await recipeClient.getRecipes(event.searchQuery);
        yield RecipeLoadSuccessState(loadedRecipes: _loadedRecipeList);
      } catch (e) {
        print(e);
        yield RecipeErrorState();
      }
    }
  }
}
