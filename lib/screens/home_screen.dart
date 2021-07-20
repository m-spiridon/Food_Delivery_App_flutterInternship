import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/screens/cart_screen/bloc/cart_state.dart';
import 'package:internship_project_1/screens/cart_screen/cart_screen.dart';
import 'package:internship_project_1/screens/discover_screen/discover_screen.dart';
import 'package:internship_project_1/screens/login_screen/auth_route.dart';
import 'package:internship_project_1/screens/products/products_screen.dart';
import 'package:internship_project_1/screens/recipes/recipes_screen.dart';
import 'package:internship_project_1/shared/colors.dart';
import 'package:internship_project_1/shared/screens_list.dart';

import 'cart_screen/bloc/cart_bloc.dart';
import 'discover_screen/discover_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  int selectedIndex;

  HomeScreen({this.selectedIndex = 0});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final keyForRecipeScreen = GlobalKey<NavigatorState>();
  List<Widget> screenLists = [];

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    List<Destination> allDestinations = <Destination>[
      Destination('Discover', Icon(Icons.explore)),
      Destination('Products', Icon(Icons.search)),
      Destination('Recipes', Icon(Icons.restaurant)),
      Destination('Account', Icon(Icons.person_outline)),
      Destination('Cart', cartIcon()),
    ];

    void onItemTapped(int index) {
      setState(() {
        widget.selectedIndex = index;
      });
    }

    void discoverToRecipesPageButton() {
      setState(() {
        widget.selectedIndex = getIndexOfRecipePage(screenLists);
      });
    }

    screenLists = [
      DiscoverScreen(onClick: discoverToRecipesPageButton),
      ProductsScreen(),
      RecipesScreen(
        key: keyForRecipeScreen,
      ),
      AuthRoute(),
      CartScreen(),
    ];

    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[widget.selectedIndex].currentState.maybePop();
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator(0, screenLists),
            _buildOffstageNavigator(1, screenLists),
            _buildOffstageNavigator(2, screenLists),
            _buildOffstageNavigator(3, screenLists),
            _buildOffstageNavigator(4, screenLists),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.selectedIndex,
          onTap: onItemTapped,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          iconSize: 30.0,
          items: allDestinations.map((Destination destination) {
            return BottomNavigationBarItem(
                icon: destination.icon, label: destination.title);
          }).toList(),
        ),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(
      BuildContext context, int index, List screenLists) {
    return {
      '/': (context) {
        return screenLists.elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index, List screenLists) {
    var routeBuilders = _routeBuilders(context, index, screenLists);
    return Offstage(
      offstage: widget.selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        },
      ),
    );
  }

  int getIndexOfRecipePage(List screenLists) {
    return screenLists.indexWhere((screen) => screen.key == keyForRecipeScreen);
  }

  Stack cartIcon() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.shopping_cart_outlined),
        BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state is CartLoadSuccessState) {
            return Positioned(
              top: 0.0,
              right: 0.0,
              child: ClipOval(
                child: Material(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      color: orange,
                      child: Text(
                        state.loadedCartItems.length.toString(),
                        style: TextStyle(fontSize: 12.0),
                      )),
                ),
              ),
            );
          }
          return SizedBox();
        }),
      ],
    );
  }
}
