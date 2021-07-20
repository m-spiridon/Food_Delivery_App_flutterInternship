part of 'product_item_bloc.dart';

abstract class ProductItemState {}

class ProductItemLoadingState extends ProductItemState {}

class ProductItemLoadState extends ProductItemState {
  Product loadedProduct;
  ProductItemLoadState({@required this.loadedProduct})
      : assert(loadedProduct != null);
}

class ProductItemLoadSuccessState extends ProductItemState {
  Product loadedProduct;
  ProductItemLoadSuccessState({@required this.loadedProduct})
      : assert(loadedProduct != null);
}

class ProductItemErrorState extends ProductItemState {}
