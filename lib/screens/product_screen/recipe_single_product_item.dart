import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internship_project_1/components/recipe_card_idea.dart';
import 'package:internship_project_1/components/single_product_card.dart';
import 'package:internship_project_1/components/tabs_widgets.dart';
import 'package:internship_project_1/components/view_all_btn.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/mocks/recipes_mock.dart';
import 'package:internship_project_1/mocks/single_product_mock.dart';
import 'package:internship_project_1/models/cart_item.dart';
import 'package:internship_project_1/models/favorite_item_model.dart';
import 'package:internship_project_1/screens/cart_screen/bloc/cart_bloc.dart';
import 'package:internship_project_1/screens/cart_screen/bloc/cart_event.dart';
import 'package:internship_project_1/screens/favorite_screen/bloc/favorite_bloc.dart';
import 'package:internship_project_1/screens/product_screen/bloc/product_item_bloc.dart';
import 'package:internship_project_1/screens/product_screen/widgets/recipe_carousel.dart';
import 'package:internship_project_1/screens/products/products_data.dart';
import 'package:internship_project_1/screens/recipes/recipes_screen.dart';
import 'package:internship_project_1/shared/colors.dart';

class SingleProduct extends StatefulWidget {
  //static const String id = 'recipe_product';
  final id;

  const SingleProduct({Key key, this.id = 1}) : super(key: key);

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  var isVisible;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var shelfTime = S.of(context).productShelfTime +
        ' ' +
        recipes['life'].toString() +
        ' ' +
        S.of(context).productDays;
    var producerCounrty =
        S.of(context).productProducedIn + ' ' + recipes['country'];

    final ProductItemBloc productBloc =
        BlocProvider.of<ProductItemBloc>(context);
    productBloc.add(ProductItemLoadEvent(widget.id));

    return BlocBuilder<ProductItemBloc, ProductItemState>(
      builder: (context, state) {
        if (state is ProductItemLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(orange),
            ),
          );
        } else if (state is ProductItemLoadSuccessState) {
          return Scaffold(
            body: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                setState(() {
                  if (scrollNotification.metrics.pixels > 300) {
                    isVisible = true;
                  } else {
                    isVisible = false;
                  }
                });

                return true;
              },
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      NetworkImage(state.loadedProduct.image),
                                  fit: BoxFit.cover,
                                ),
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
                                      final FavoriteBloc favBloc =
                                          BlocProvider.of<FavoriteBloc>(
                                              context);
                                      favBloc.add(
                                        FavoriteAddItemEvent(
                                          FavoriteItem(productId: widget.id),
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ],
                        ),
                        //Button & wraps
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.loadedProduct.title,
                                style: TextStyle(fontSize: 20.0),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    S.of(context).currency +
                                        state.loadedProduct.price.toString(),
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      final CartBloc cartBloc =
                                          BlocProvider.of<CartBloc>(context);
                                      cartBloc.add(
                                        CartAddItemEvent(
                                          CartItem(
                                            productId: widget.id,
                                            quantity: 1,
                                          ),
                                        ),
                                      );
                                      Fluttertoast.showToast(
                                        msg: S
                                            .of(context)
                                            .toastMsgForSingleProduct(
                                                state.loadedProduct.title),
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        fontSize: 16.0,
                                      );
                                    },
                                    child: Text(
                                      S.of(context).addBtnText,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.0),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: orange),
                                  ),
                                ],
                              ),
                              Text(
                                recipes['wrap'].toString() +
                                    " " +
                                    S.of(context).productWraps,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                        WrapCarousel(
                          wraps: recipes['categories'],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 25.0),
                          child: TabsDivider(),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                recipes['description'],
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                shelfTime,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                producerCounrty,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15.0),
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: products
                                .map<Widget>((it) => Container(
                                      margin: const EdgeInsets.all(8.0),
                                      child: SingleProductCard(
                                        id: it['id'],
                                        title: it['title'],
                                        subtitle: it['subtitle'],
                                        amount: it['amount'],
                                        price: it['price'],
                                        image: it['image'],
                                        isHorizontal: false,
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),

                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    S.of(context).recipeIdeas,
                                    style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  ViewAllBtn(onClick: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RecipesScreen()),
                                    );
                                  })
                                ],
                              ),
                              Container(
                                  child: Column(
                                children: recipesMock
                                    .map((recipe) => RecipeCardMini(
                                          recipe['name'],
                                          recipe['desc'],
                                          recipe['image'],
                                        ))
                                    .take(2)
                                    .toList(),
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Visibility(
                      visible: isVisible,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            final CartBloc cartBloc =
                                BlocProvider.of<CartBloc>(context);
                            cartBloc.add(
                              CartAddItemEvent(
                                CartItem(
                                  productId: widget.id,
                                  quantity: 1,
                                ),
                              ),
                            );
                            Fluttertoast.showToast(
                              msg: S.of(context).toastMsgForSingleProduct(
                                  state.loadedProduct.title),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              fontSize: 16.0,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(10.0), primary: orange),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$' + recipes['price'],
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              Text(
                                S.of(context).productAddBtn,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (state is ProductItemErrorState) {
          return Center(
            child: Text(S.of(context).errorState),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(orange),
          ),
        );
      },
    );
  }
}
