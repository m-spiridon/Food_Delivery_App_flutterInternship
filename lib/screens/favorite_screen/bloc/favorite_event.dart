part of 'favorite_bloc.dart';

abstract class FavoriteEvent {}

class FavoriteAddItemEvent extends FavoriteEvent {
  FavoriteItem item;
  FavoriteAddItemEvent(this.item);
}

class FavoriteLoadEvent extends FavoriteEvent {
  FavoriteLoadEvent();
}
