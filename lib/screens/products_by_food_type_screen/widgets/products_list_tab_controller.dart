import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/components/single_product_card.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/products/bloc/products_bloc.dart';
import 'package:internship_project_1/screens/products/bloc/products_event.dart';
import 'package:internship_project_1/screens/products/bloc/products_state.dart';
import 'package:internship_project_1/screens/products_search_screen/products_search_screen.dart';
import 'package:internship_project_1/shared/colors.dart';

class ProductsListTabController extends StatelessWidget {
  final String foodType;

  const ProductsListTabController({Key key, @required this.foodType})
      : super(key: key);

  String capitalize(String string) {
    if (string == null || string.isEmpty) {
      return string;
    }
    return string[0].toUpperCase() + string.substring(1);
  }

  List<Widget> getProductLists(
      {@required List loadedProducts, @required List categories}) {
    var productLists = [
      ListView.builder(
          itemCount: loadedProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return SingleProductCard(
              id: loadedProducts[index].id,
              title: loadedProducts[index].title,
              price: loadedProducts[index].price,
              image: loadedProducts[index].image,
              isHorizontal: true,
              subtitle: loadedProducts[index].subtitle,
              amount: loadedProducts[index].amount,
            );
          }),
    ];

    for (int i = 0; i < categories.length; i++) {
      productLists.add(
        ListView.builder(
            itemCount: loadedProducts.length,
            itemBuilder: (BuildContext context, int index) {
              if (loadedProducts[index].category.contains(categories[i])) {
                return SingleProductCard(
                  id: loadedProducts[index].id,
                  title: loadedProducts[index].title,
                  price: loadedProducts[index].price,
                  image: loadedProducts[index].image,
                  isHorizontal: true,
                  subtitle: loadedProducts[index].subtitle,
                  amount: loadedProducts[index].amount,
                );
              }
              return SizedBox();
            }),
      );
    }

    return productLists;
  }

  @override
  Widget build(BuildContext context) {
    final ProductsBloc productsBloc = BlocProvider.of<ProductsBloc>(context);
    productsBloc.add(ProductsByFoodTypeLoadEvent(foodType: foodType));

    return BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
      if (state is ProductsLoadingState) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(orange),
          ),
        );
      }

      if (state is ProductsLoadSuccessState) {
        var categories = [];
        state.loadedProducts.forEach((element) {
          if (!categories.contains(element.category)) {
            categories.add(element.category);
          }
        });

        return DefaultTabController(
          length: categories.length + 1,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(foodType),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.orange,
                  iconSize: 28.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductsSearchScreen()),
                    );
                  },
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: orange,
                labelStyle: TextStyle(fontSize: 16.0),
                tabs: [
                  Tab(text: S.of(context).all),
                  ...List.generate(
                      categories.length,
                      (index) => Tab(
                            text: capitalize(categories[index]),
                          ))
                ],
              ),
            ),
            body: TabBarView(
              children: getProductLists(
                  loadedProducts: state.loadedProducts, categories: categories),
            ),
          ),
        );
      }

      if (state is ProductsErrorState) {
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
