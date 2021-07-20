import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/local_storage/repositories/cart_repository.dart';
import 'package:internship_project_1/models/cart_item.dart';
import 'package:internship_project_1/models/product_model.dart';
import 'package:internship_project_1/repositories/product/product_repository.dart';
import 'package:internship_project_1/screens/cart_screen/bloc/cart_event.dart';
import 'package:internship_project_1/screens/cart_screen/bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoadingState());

  _getAllProducts() async {
    final List<CartItem> _loadedCartItems = await CartRepository.getAll();
    final List<Product> _products = [];
    final ProductRepository productRepository = ProductRepository();
    for (CartItem item in _loadedCartItems) {
      final Product product =
          await productRepository.getProductWithId(item.productId);
      product.quantity = item.quantity;
      _products.add(product);
    }
    return _products;
  }

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartLoadEvent) {
      try {
        final _products = await _getAllProducts();
        yield _products.isNotEmpty
            ? CartLoadSuccessState(loadedCartItems: _products)
            : CartEmptyState();
      } catch (e) {
        print(e);
        yield CartErrorState();
      }
    } else if (event is CartAddItemEvent) {
      try {
        final existingItem = await CartRepository.getById(event.item.productId);
        if (existingItem != null) {
          await CartRepository.update(CartItem(
              productId: existingItem.productId,
              quantity: existingItem.quantity + 1));
        } else {
          await CartRepository.create(event.item);
        }
        final _products = await _getAllProducts();
        yield _products.isNotEmpty
            ? CartLoadSuccessState(loadedCartItems: _products)
            : CartEmptyState();
      } catch (e) {
        print(e);
        yield CartErrorState();
      }
    } else if (event is CartDeleteItemEvent) {
      try {
        final existingItem = await CartRepository.getById(event.id);
        if (existingItem != null && existingItem.quantity > 1) {
          await CartRepository.update(CartItem(
              productId: existingItem.productId,
              quantity: existingItem.quantity - 1));
        } else {
          await CartRepository.delete(event.id);
        }
        final _products = await _getAllProducts();
        yield _products.isNotEmpty
            ? CartLoadSuccessState(loadedCartItems: _products)
            : CartEmptyState();
      } catch (e) {
        print(e);
        yield CartErrorState();
      }
    }
  }
}
