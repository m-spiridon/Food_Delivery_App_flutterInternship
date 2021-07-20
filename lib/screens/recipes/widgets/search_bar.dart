import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/products/bloc/products_event.dart';
import 'package:internship_project_1/screens/recipes/bloc/recipe_event.dart';
import 'package:internship_project_1/shared/px2dpx.dart';

enum FromScreen { products, productsSearch, recipes }

class SearchBar extends StatelessWidget {
  final FromScreen fromScreen;
  final bloc;
  SearchBar({@required this.fromScreen, this.bloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: convertPx2Dpx(context, 10.0),
      width: MediaQuery.of(context).size.width * 0.7,
      padding: EdgeInsets.all(
        convertPx2Dpx(context, 5),
      ),
      child: TextField(
        onChanged: (value) {
          if (fromScreen == FromScreen.productsSearch) {
            EasyDebounce.debounce(
                'search-debouncer',
                Duration(milliseconds: 500),
                () => bloc.add(ProductsByNameLoadEvent(searchQuery: value)));
          }
          if (fromScreen == FromScreen.recipes) {
            EasyDebounce.debounce(
                'search-debouncer',
                Duration(milliseconds: 500),
                () => bloc.add(RecipeLoadEvent(value)));
          }
        },
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                convertPx2Dpx(context, 45),
              ),
            ),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: S.of(context).searchBarHintText,
        ),
      ),
    );
  }
}
