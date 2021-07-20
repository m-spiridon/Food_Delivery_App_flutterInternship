import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/products/bloc/products_bloc.dart';
import 'package:internship_project_1/screens/products/bloc/products_event.dart';
import 'package:internship_project_1/screens/products/bloc/products_state.dart';
import 'package:internship_project_1/screens/products/widgets/food_type_card.dart';
import 'package:internship_project_1/shared/colors.dart';

class FoodTypesCardsList extends StatelessWidget {
  const FoodTypesCardsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsBloc productsBloc = BlocProvider.of<ProductsBloc>(context);
    productsBloc.add(FoodTypesLoadEvent());

    return BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
      if (state is FoodTypesLoadingState) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(orange),
          ),
        );
      }
      if (state is FoodTypesLoadSuccessState) {
        return Column(
          children: List.generate(
            state.loadedFoodTypes.length,
            (index) => FoodTypeCard(
                name: state.loadedFoodTypes[index].name,
                background: state.loadedFoodTypes[index].background),
          ),
        );
      }
      if (state is FoodTypesErrorState) {
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
