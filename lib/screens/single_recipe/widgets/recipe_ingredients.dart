import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internship_project_1/components/single_product_card.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/shared/colors.dart';

class IngredientsScreen extends StatelessWidget {
  final productsList;

  IngredientsScreen({this.productsList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(S.of(context).recipeIngredients,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w700)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: productsList.length,
          itemBuilder: (BuildContext context, int index) {
            DocumentReference product = productsList[index];
            return FutureBuilder(
              future: product.get(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(S.of(context).errorState),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(orange),
                    ),
                  );
                }

                return SingleProductCard(
                    id: snapshot.data['id'],
                    title: snapshot.data['title'],
                    subtitle: snapshot.data['subtitle'],
                    amount: snapshot.data['amount'],
                    isHorizontal: true,
                    price: snapshot.data['price'],
                    image: snapshot.data['image']);
              },
            );
          }),
    );
  }
}
