import 'package:flutter/material.dart';
import 'package:internship_project_1/screens/account_screen/account_orders.dart';
import 'package:internship_project_1/shared/px2dpx.dart';

class YourOrders extends StatelessWidget {
  const YourOrders({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: convertPx2Dpx(context, 20),
            ),
            AccountOrders(),
          ],
        ),
      ),
    );
  }
}
