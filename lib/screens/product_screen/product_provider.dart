import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/repositories/product/product_repository.dart';
import 'package:internship_project_1/screens/product_screen/bloc/product_item_bloc.dart';
import 'package:internship_project_1/screens/product_screen/recipe_single_product_item.dart';

class ProductBuilder extends StatelessWidget {
  final id;
  final title;
  final productRepo = ProductRepository();

  ProductBuilder({Key key, this.id, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductItemBloc>(
      create: (context) => ProductItemBloc(productRepo),
      child: Container(
        child: SingleProduct(
          id: id,
        ),
      ),
    );
  }
}
