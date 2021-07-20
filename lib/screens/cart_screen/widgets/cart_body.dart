import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/cart_screen/bloc/cart_bloc.dart';
import 'package:internship_project_1/screens/cart_screen/bloc/cart_event.dart';
import 'package:internship_project_1/screens/cart_screen/bloc/cart_state.dart';
import 'package:internship_project_1/screens/cart_screen/widgets/cart_list_view.dart';
import 'package:internship_project_1/screens/cart_screen/widgets/empty_cart.dart';

class CartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    cartBloc.add(CartLoadEvent());

    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is CartAddItemSuccessState ||
          state is CartDeleteItemSuccessState) {
        cartBloc.add(CartLoadEvent());
        return Center(child: CircularProgressIndicator());
      }
      if (state is CartEmptyState) {
        return EmptyCart();
      }
      if (state is CartLoadSuccessState) {
        return CartListView(
          cartItems: state.loadedCartItems,
        );
      }

      if (state is CartErrorState) {
        return Center(
          child: Text(S.of(context).errorState),
        );
      }
      return Center(child: Text(S.of(context).errorStateLoading));
    });
  }
}
