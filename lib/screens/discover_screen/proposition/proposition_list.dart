import 'package:flutter/material.dart';
import 'package:internship_project_1/components/single_product_card.dart';
import 'package:internship_project_1/mocks/proposition_data.dart';

class PropositionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List propositionItems = propositionData['item'];

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('${propositionData['title']}'),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(),
          itemCount: propositionItems.length,
          itemBuilder: (BuildContext context, int index) {
            return SingleProductCard(
                id: propositionItems[index]['id'],
                title: propositionItems[index]['title'],
                subtitle: propositionItems[index]['subtitle'],
                amount: propositionItems[index]['amount'],
                isHorizontal: true,
                price: propositionItems[index]['price'],
                image: propositionItems[index]['image']);
          },
        ));
  }
}
