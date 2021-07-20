import 'package:internship_project_1/models/cart_item.dart';

abstract class CartEvent {}

class CartAddItemEvent extends CartEvent {
  CartItem item;
  CartAddItemEvent(this.item);
}

class CartDeleteItemEvent extends CartEvent {
  int id;
  CartDeleteItemEvent(this.id);
}

class CartUpdateEvent extends CartEvent {
  CartUpdateEvent();
}

class CartLoadEvent extends CartEvent {
  CartLoadEvent();
}
