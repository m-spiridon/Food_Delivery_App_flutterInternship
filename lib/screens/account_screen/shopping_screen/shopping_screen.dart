import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/account_screen/add_list/modal_add.dart';
import 'package:internship_project_1/screens/account_screen/shopping_screen/shopping_screen_view.dart';
import 'package:internship_project_1/shared/px2dpx.dart';

class ShoppingScreen extends StatefulWidget {
  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  Color green = Colors.green[900];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Favourites'),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.transparent,
                elevation: 0,
                child: ListTile(
                  title: Center(
                      child: Text(
                    S.of(context).noFavorites,
                    style: TextStyle(fontSize: convertPx2Dpx(context, 7)),
                  )),
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset('images/no_orders.png'))
            ],
          )),
    );
  }
}
