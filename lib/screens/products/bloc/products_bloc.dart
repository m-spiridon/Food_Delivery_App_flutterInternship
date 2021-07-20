import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/screens/products/bloc/products_event.dart';
import 'package:internship_project_1/screens/products/bloc/products_state.dart';
import 'package:internship_project_1/screens/products/models/food_type.dart';
import 'package:internship_project_1/screens/products/models/product.dart';
import 'package:internship_project_1/screens/products/services/products_api_client.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsClient productsClient;
  ProductsBloc(this.productsClient) : super(FoodTypesLoadingState());

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if (event is FoodTypesLoadEvent) {
      try {
        final List<FoodType> _loadedFoodTypesList =
            await productsClient.getFoodTypes();
        yield FoodTypesLoadSuccessState(loadedFoodTypes: _loadedFoodTypesList);
      } catch (e) {
        print(e);
        yield FoodTypesErrorState();
      }
    }

    if (event is ProductsByFoodTypeLoadEvent) {
      yield ProductsLoadingState();
      try {
        final List<Product> _loadedProductsList =
            await productsClient.getProductsByFoodType(event.foodType);
        yield ProductsLoadSuccessState(loadedProducts: _loadedProductsList);
      } catch (e) {
        print(e);
        yield ProductsErrorState();
      }
    }

    if (event is ProductsByNameLoadEvent) {
      yield ProductsLoadingState();
      try {
        final List<Product> _loadedProductsList =
            await productsClient.getProductsByName(event.searchQuery);
        yield ProductsLoadSuccessState(loadedProducts: _loadedProductsList);
      } catch (e) {
        print(e);
        yield ProductsErrorState();
      }
    }
  }
}
