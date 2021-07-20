import 'package:flutter/foundation.dart';
import 'package:internship_project_1/models/product_model.dart';

abstract class CartState {}

class CartLoadingState extends CartState {}

class CartLoadSuccessState extends CartState {
  List<Product> loadedCartItems;
  CartLoadSuccessState({@required this.loadedCartItems})
      : assert(loadedCartItems != null);
}

class CartAddItemSuccessState extends CartState {}

class CartDeleteItemSuccessState extends CartState {}

class CartEmptyState extends CartState {}

class CartErrorState extends CartState {}
