import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/recipes/bloc/recipe_bloc.dart';
import 'package:internship_project_1/screens/recipes/bloc/recipe_event.dart';
import 'package:internship_project_1/screens/recipes/bloc/recipe_state.dart';
import 'package:internship_project_1/screens/recipes/widgets/recipe_card.dart';
import 'package:internship_project_1/shared/colors.dart';

class DiscoverRecipeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RecipeBloc recipeBloc = BlocProvider.of<RecipeBloc>(context);
    recipeBloc.add(RecipeLoadEvent(''));

    return BlocBuilder<RecipeBloc, RecipeState>(builder: (context, state) {
      if (state is RecipeLoadingState) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(orange),
          ),
        );
      }
      if (state is RecipeLoadSuccessState) {
        return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: state.loadedRecipes.length,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: RecipeCard(
                  id: state.loadedRecipes[index].id,
                  name: state.loadedRecipes[index].name,
                  image: state.loadedRecipes[index].image,
                  timeToCook: state.loadedRecipes[index].timeToCook,
                  portions: state.loadedRecipes[index].portions,
                  price: state.loadedRecipes[index].price,
                  portionSize: state.loadedRecipes[index].portionSize,
                  description: state.loadedRecipes[index].description,
                ),
              );
            });
      }
      if (state is RecipeErrorState) {
        return Center(
          child: Text(S.of(context).errorState),
        );
      }
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(orange),
        ),
      );
    });
  }
}
