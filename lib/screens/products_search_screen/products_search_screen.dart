import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/products/services/products_api_client.dart';
import 'package:internship_project_1/screens/products_search_screen/widgets/products_list_by_name.dart';
import 'package:internship_project_1/screens/products_search_screen/widgets/products_search_bar.dart';

import '../products/bloc/products_bloc.dart';

class ProductsSearchScreen extends StatelessWidget {
  ProductsSearchScreen({Key key}) : super(key: key);

  final productsClient = ProductsClient();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
      create: (context) => ProductsBloc(productsClient),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          actions: [
            ProductsSearchBar(),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text(
                S.of(context).cancel,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: ProductsListByName(),
      ),
    );
  }
}
