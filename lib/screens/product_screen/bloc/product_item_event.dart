part of 'product_item_bloc.dart';

abstract class ProductItemEvent {}

class ProductItemLoadEvent extends ProductItemEvent {
  int id;
  ProductItemLoadEvent(this.id);
}
