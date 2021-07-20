part of 'favorite_bloc.dart';

abstract class FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteLoadSuccessState extends FavoriteState {
  List<Product> loadedFavoriteItems;
  FavoriteLoadSuccessState({@required this.loadedFavoriteItems})
      : assert(loadedFavoriteItems != null);
}

class FavoriteAddItemSuccessState extends FavoriteState {}

class FavoriteErrorState extends FavoriteState {}
