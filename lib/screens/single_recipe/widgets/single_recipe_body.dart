import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internship_project_1/components/tabs_widgets.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/models/cart_item.dart';
import 'package:internship_project_1/screens/cart_screen/bloc/cart_bloc.dart';
import 'package:internship_project_1/screens/cart_screen/bloc/cart_event.dart';
import 'package:internship_project_1/screens/single_recipe/bloc/single_recipe_bloc.dart';
import 'package:internship_project_1/screens/single_recipe/bloc/single_recipe_event.dart';
import 'package:internship_project_1/screens/single_recipe/bloc/single_recipe_state.dart';
import 'package:internship_project_1/screens/single_recipe/widgets/recipe_bar.dart';
import 'package:internship_project_1/shared/colors.dart';

class SingleRecipeBody extends StatefulWidget {
  final id;

  const SingleRecipeBody({Key key, this.id}) : super(key: key);

  @override
  _SingleRecipeBodyState createState() => _SingleRecipeBodyState();
}

class _SingleRecipeBodyState extends State<SingleRecipeBody> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final SingleRecipeBloc recipeBloc =
        BlocProvider.of<SingleRecipeBloc>(context);
    recipeBloc.add(SingleRecipeLoadEvent(widget.id));

    return BlocBuilder<SingleRecipeBloc, SingleRecipeState>(
        builder: (context, state) {
      if (state is SingleRecipeLoadingState) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(orange),
          ),
        );
      }
      if (state is SingleRecipeLoadSuccessState) {
        return ListView(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Image.network(
                    state.loadedRecipe.image,
                    fit: BoxFit.cover,
                  ),
                ),
                AppBar(
                  leading: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  backgroundColor: Colors.transparent,
                  actions: [
                    IconButton(
                        icon: isFavorite == false
                            ? Icon(Icons.favorite_outline)
                            : Icon(Icons.favorite),
                        iconSize: 30.0,
                        color: orange,
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        }),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.loadedRecipe.name,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).currency +
                            state.loadedRecipe.price.toString(),
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () async {
                          final CartBloc cartBloc =
                              BlocProvider.of<CartBloc>(context);
                          for (DocumentReference productDoc
                              in state.loadedRecipe.productsList) {
                            final productSnap = await productDoc.get();
                            cartBloc.add(
                              CartAddItemEvent(
                                CartItem(
                                  productId: productSnap.get('id'),
                                  quantity: 1,
                                ),
                              ),
                            );
                          }
                          Fluttertoast.showToast(
                            msg: S.of(context).toastMsgForAllItemsProduct(
                                state.loadedRecipe.name),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            fontSize: 16.0,
                          );
                        },
                        child: Text(
                          S.of(context).addBtnText,
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        style: TextButton.styleFrom(backgroundColor: orange),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  TabsDivider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Text(
                      state.loadedRecipe.description,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w300),
                    ),
                  ),
                  RecipeBar(
                    productsList: state.loadedRecipe.productsList,
                    recipeInstructions: state.loadedRecipe.recipeInstructions,
                  ),
                ],
              ),
            ),
          ],
        );
      }
      if (state is SingleRecipeErrorState) {
        return Center(
          child: Text(S.of(context).errorState),
        );
      }
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(orange),
        ),
      );
    });
  }
}
