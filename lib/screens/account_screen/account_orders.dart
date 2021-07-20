import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/account_screen/item_card.dart';
import 'package:internship_project_1/screens/account_screen/shopping_screen/models/groups_mock.dart';
import 'package:internship_project_1/shared/px2dpx.dart';

class AccountOrders extends StatefulWidget {
  @override
  _AccountOrdersState createState() => _AccountOrdersState();
}

class _AccountOrdersState extends State<AccountOrders> {
  Widget emptyList(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            Card(
              color: Colors.transparent,
              elevation: 0,
              child: ListTile(
                title: Center(
                    child: Text(
                  S.of(context).noOrders,
                  style: TextStyle(fontSize: convertPx2Dpx(context, 7)),
                )),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Center(
                    child: Text(S.of(context).createOne,
                        style: TextStyle(fontSize: convertPx2Dpx(context, 6))),
                  ),
                ),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image.asset('images/no_orders.png'))
          ],
        ));
  }

  double totalPrice = 0.0;

  int getTotalPrice() {
    for (int i = 0; i < basicGroups.length; i++) {
      double itemPrice = basicGroups[i].products[i]['price'];

      totalPrice += itemPrice;
    }
  }

  @override
  void initState() {
    getTotalPrice();

    super.initState();
  }

  var orders = [];

  @override
  Widget build(BuildContext context) {
    return basicGroups == null || orders.length == 0
        ? emptyList(context)
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.33,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: basicGroups.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemCard(
                        title: basicGroups[index].name,
                        count: basicGroups[index].products.length.toString(),
                        image: basicGroups[index].products[index]['image'],
                        price: basicGroups[index].products[index]['price'],
                        isShopping: false,
                      );
                    }),
              ),
              Text(S.of(context).totalPrice +
                  '${totalPrice.toStringAsFixed(2)}'),
            ],
          );
  }
}
