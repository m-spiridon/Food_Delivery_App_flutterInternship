import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/models/favorite_item_model.dart';
import 'package:internship_project_1/screens/favorite_screen/bloc/favorite_bloc.dart';

class FavoriteSingleGroup extends StatelessWidget {
  final id;
  final name;
  FavoriteSingleGroup(this.id, this.name);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print("add item");
        //basicGroups[index].products.add(product);
        final favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
        favoriteBloc.add(
          FavoriteAddItemEvent(FavoriteItem(productId: id)),
        );
      },
      child: Text(name),
    );
  }
}
