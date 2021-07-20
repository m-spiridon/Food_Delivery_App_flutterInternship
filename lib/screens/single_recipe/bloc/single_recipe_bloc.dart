import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/screens/single_recipe/bloc/single_recipe_event.dart';
import 'package:internship_project_1/screens/single_recipe/bloc/single_recipe_state.dart';
import 'package:internship_project_1/screens/recipes/models/recipe.dart';
import 'package:internship_project_1/screens/recipes/services/recipe_api_client.dart';

class SingleRecipeBloc extends Bloc<SingleRecipeEvent, SingleRecipeState> {
  final RecipeClient recipeClient;
  SingleRecipeBloc(this.recipeClient) : super(SingleRecipeLoadingState());

  @override
  Stream<SingleRecipeState> mapEventToState(SingleRecipeEvent event) async* {
    if (event is SingleRecipeLoadEvent) {
      try {
        final Recipe _loadedRecipe =
            await recipeClient.getSingleRecipe(event.id);
        yield SingleRecipeLoadSuccessState(loadedRecipe: _loadedRecipe);
      } catch (e) {
        print(e);
        yield SingleRecipeErrorState();
      }
    }
  }
}
