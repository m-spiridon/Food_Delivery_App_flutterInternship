import 'package:flutter/foundation.dart';

abstract class ProductsEvent {}

class FoodTypesLoadEvent extends ProductsEvent {}

class ProductsByFoodTypeLoadEvent extends ProductsEvent {
  String foodType;
  ProductsByFoodTypeLoadEvent({@required this.foodType});
}

class ProductsByNameLoadEvent extends ProductsEvent {
  String searchQuery;
  ProductsByNameLoadEvent({@required this.searchQuery});
}
