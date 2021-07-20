import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/screens/products/bloc/products_bloc.dart';
import 'package:internship_project_1/screens/products/services/products_api_client.dart';
import 'package:internship_project_1/screens/products_by_food_type_screen/widgets/products_list_tab_controller.dart';

class ProductsByFoodTypeScreen extends StatelessWidget {
  static const String id = 'products_by_food_type';
  final foodType;

  ProductsByFoodTypeScreen({Key key, this.foodType}) : super(key: key);

  final productsClient = ProductsClient();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
      create: (context) => ProductsBloc(productsClient),
      child: ProductsListTabController(
        foodType: foodType,
      ),
    );
  }
}
