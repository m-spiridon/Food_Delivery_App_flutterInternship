import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/components/single_product_card.dart';
import 'package:internship_project_1/screens/products/bloc/products_bloc.dart';
import 'package:internship_project_1/screens/products/bloc/products_event.dart';
import 'package:internship_project_1/screens/products/bloc/products_state.dart';

class ProductsListByName extends StatelessWidget {
  const ProductsListByName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsBloc productsBloc = BlocProvider.of<ProductsBloc>(context);
    productsBloc.add(ProductsByNameLoadEvent(searchQuery: ''));

    return BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
      if (state is ProductsLoadingState) {
        return Center(child: CircularProgressIndicator());
      }

      if (state is ProductsLoadSuccessState) {
        return ListView.builder(
            itemCount: state.loadedProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return SingleProductCard(
                id: state.loadedProducts[index].id,
                title: state.loadedProducts[index].title,
                price: state.loadedProducts[index].price,
                image: state.loadedProducts[index].image,
                isHorizontal: true,
                subtitle: state.loadedProducts[index].subtitle,
                amount: state.loadedProducts[index].amount,
              );
            });
      }

      if (state is ProductsErrorState) {
        print('Failure loading products');
        return Center(
          child: Text(
              'Oops...an error occurred. Maybe there is something with your internet connection'),
        );
      }
      return Center(child: Text('Loading...'));
    });
  }
}
