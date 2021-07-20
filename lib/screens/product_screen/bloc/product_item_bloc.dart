import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:internship_project_1/models/models.dart';
import 'package:internship_project_1/repositories/repositories.dart';

part 'product_item_event.dart';
part 'product_item_state.dart';

class ProductItemBloc extends Bloc<ProductItemEvent, ProductItemState> {
  final ProductRepository productRepository;
  ProductItemBloc(this.productRepository) : super(ProductItemLoadingState());

  @override
  Stream<ProductItemState> mapEventToState(
    ProductItemEvent event,
  ) async* {
    if (event is ProductItemLoadEvent) {
      try {
        final Product _loadedProduct =
            await productRepository.getProductWithId(event.id);
        yield ProductItemLoadSuccessState(loadedProduct: _loadedProduct);
      } catch (e) {
        print(e);
        yield ProductItemErrorState();
      }
    }
  }
}
