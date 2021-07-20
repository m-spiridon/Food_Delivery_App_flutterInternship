import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:internship_project_1/db/tables/favorite_repository.dart';

import 'package:internship_project_1/models/favorite_item_model.dart';
import 'package:internship_project_1/models/product_model.dart';
import 'package:internship_project_1/repositories/product/product_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteLoadingState());

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is FavoriteLoadEvent) {
      try {
        final List<FavoriteItem> _loadedFavoriteItems =
            await FavoriteRepository.getAll();
        final List<Product> _products = [];
        final ProductRepository productRepository = ProductRepository();
        for (FavoriteItem item in _loadedFavoriteItems) {
          final Product product =
              await productRepository.getProductWithId(item.productId);
          _products.add(product);
        }
        yield FavoriteLoadSuccessState(loadedFavoriteItems: _products);
      } catch (e) {
        yield FavoriteErrorState();
      }
    } else if (event is FavoriteAddItemEvent) {
      try {
        final existingItem =
            await FavoriteRepository.getById(event.item.productId);
        if (existingItem != null) {
          await FavoriteRepository.update(FavoriteItem(
            productId: existingItem.productId,
          ));
        } else {
          await FavoriteRepository.create(event.item);
        }
        yield FavoriteAddItemSuccessState();
      } catch (e) {
        yield FavoriteErrorState();
      }
    }
  }
}
