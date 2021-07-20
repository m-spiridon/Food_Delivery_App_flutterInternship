import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/components/single_product_card.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/favorite_screen/bloc/favorite_bloc.dart';

class ShoppingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FavoriteBloc favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
    favoriteBloc.add(FavoriteLoadEvent());

    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is FavoriteAddItemSuccessState) {
          favoriteBloc.add(FavoriteLoadEvent());
          return Center(child: CircularProgressIndicator());
        }
        if (state is FavoriteLoadSuccessState) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.loadedFavoriteItems.length,
              itemBuilder: (context, index) {
                return SingleProductCard(
                    id: state.loadedFavoriteItems[index].id,
                    title: state.loadedFavoriteItems[index].title,
                    subtitle: state.loadedFavoriteItems[index].subtitle,
                    amount: state.loadedFavoriteItems[index].amount,
                    isHorizontal: true,
                    price: state.loadedFavoriteItems[index].price,
                    image: state.loadedFavoriteItems[index].image);
              });
        }
        if (state is FavoriteErrorState) {
          return Text(S.of(context).noFavorites);
        }
        return Center(child: Text(S.of(context).errorStateLoading + '...'));
      },
    );
  }
}
