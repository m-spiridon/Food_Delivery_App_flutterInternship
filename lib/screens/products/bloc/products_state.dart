import 'package:flutter/foundation.dart';
import 'package:internship_project_1/screens/products/models/food_type.dart';
import 'package:internship_project_1/screens/products/models/product.dart';

abstract class ProductsState {}

//FoodTypes
class FoodTypesLoadingState extends ProductsState {}

class FoodTypesLoadSuccessState extends ProductsState {
  List<FoodType> loadedFoodTypes;
  FoodTypesLoadSuccessState({@required this.loadedFoodTypes})
      : assert(loadedFoodTypes != null);
}

class FoodTypesErrorState extends ProductsState {}

//Products
class ProductsLoadingState extends ProductsState {}

class ProductsLoadSuccessState extends ProductsState {
  List<Product> loadedProducts;
  ProductsLoadSuccessState({@required this.loadedProducts})
      : assert(loadedProducts != null);
}

class ProductsErrorState extends ProductsState {}
