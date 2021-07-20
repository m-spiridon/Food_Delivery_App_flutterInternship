import 'package:flutter/material.dart';
import 'package:internship_project_1/screens/account_screen/add_list/add_card_listView.dart';
import 'package:internship_project_1/screens/account_screen/item_card.dart';
import 'package:internship_project_1/screens/account_screen/shopping_screen/models/groups_mock.dart';
import 'package:internship_project_1/screens/account_screen/shopping_screen/product/product_list.dart';

class AccountList extends StatefulWidget {
  @override
  _AccountListState createState() => _AccountListState();
}

class _AccountListState extends State<AccountList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: basicGroups.length + 1,
          itemBuilder: (BuildContext context, index) {
            if (index == basicGroups.length) {
              return AddOne();
            }
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductList(
                            title: basicGroups[index].name,
                            products: basicGroups[index].products,
                            totalPrice: 0,
                          )),
                );
              },
              child: ItemCard(
                title: basicGroups[index].name,
                count: basicGroups[index].products.length.toString(),
                image: basicGroups[index].products[index]['image'],
                isShopping: true,
              ),
            );
          }),
    );
  }
}
