import 'package:flutter/material.dart';
import 'package:internship_project_1/components/single_product_card.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/models/models.dart';
import 'package:internship_project_1/screens/products/products_data.dart';

class ProducerDetails extends StatelessWidget {
  final Producer producer;

  ProducerDetails({Key key, @required this.producer}) : super(key: key);

  Widget ImagePart(context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(producer.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 40.0,
              ),
              child: Text(
                producer.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImagePart(context),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    producer.description,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    S.of(context).productsFrom + producer.name,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: products
                    .map<Widget>((it) => Padding(
                          padding: const EdgeInsets.all(4.0),
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
          ],
        ),
      ),
    );
  }
}
