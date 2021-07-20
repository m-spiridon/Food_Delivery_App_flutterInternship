import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/screens/products/bloc/products_bloc.dart';
import 'package:internship_project_1/screens/recipes/widgets/search_bar.dart';

class ProductsSearchBar extends StatelessWidget {
  const ProductsSearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsBloc productsBloc = BlocProvider.of<ProductsBloc>(context);
    return SearchBar(fromScreen: FromScreen.productsSearch, bloc: productsBloc);
  }
}
