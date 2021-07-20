import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/general_widgets/search_bar_widget.dart';
import 'package:internship_project_1/screens/products/services/products_api_client.dart';
import 'package:internship_project_1/screens/products/widgets/food_types_cards_list.dart';
import 'package:internship_project_1/screens/products/widgets/producers_list_horizontal.dart';
import 'package:internship_project_1/screens/products_search_screen/products_search_screen.dart';

import 'bloc/products_bloc.dart';

class ProductsScreen extends StatelessWidget {
  static const String id = 'products_screen';

  final productsClient = ProductsClient();

  Route getProductsSearchScreenRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ProductsSearchScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end);
          var curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
      create: (context) => ProductsBloc(productsClient),
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(S.of(context).productsScreenTitle),
            centerTitle: true,
          ),
          body: ListView(children: [
            SearchBarWidget(
              onChangeValue: (value) {
                print(value);
              },
              onEditingComplete: () {
                print('End of edit');
              },
            ),
            FoodTypesCardsList(),
            ProducersListHorizontal(),
          ])),
    );
  }
}
