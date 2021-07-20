import 'package:flutter/material.dart';
import 'package:internship_project_1/screens/product_screen/product_provider.dart';
import 'package:internship_project_1/shared/px2dpx.dart';

class SingleProductCard extends StatefulWidget {
  final title;
  final desc;
  final defaultSize;
  final image;
  final price;

  SingleProductCard({
    @required this.title,
    @required this.desc,
    @required this.defaultSize,
    @required this.image,
    @required this.price,
  });

  @override
  _SingleProductCardState createState() => _SingleProductCardState();
}

class _SingleProductCardState extends State<SingleProductCard> {
  int inCount = 1;

  double multiPrice;
  @override
  void initState() {
    multiPrice = double.tryParse(widget.price);
    super.initState();
  }

  void _addItem() {
    setState(() {
      inCount++;
      multiPrice = double.tryParse(widget.price) * inCount;
    });
  }

  void _removeItem() {
    setState(() {
      if (inCount > 1) {
        inCount--;
        multiPrice -= double.tryParse(widget.price);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var price = "\$" + multiPrice.toStringAsFixed(2);
    return Container(
      color: Colors.green[50],
      width: MediaQuery.of(context).size.width * 1,
      margin: EdgeInsets.only(bottom: convertPx2Dpx(context, 3)),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductBuilder(),
                    ));
              },
              child: Image.network(
                widget.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: convertPx2Dpx(context, 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title),
                      Text(widget.desc),
                      Text(inCount.toString() + " " + widget.defaultSize),
                      SizedBox(
                        height: convertPx2Dpx(context, 20),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Qty ' + inCount.toString()),
                          Text(price),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: _addItem,
                          ),
                          Text(inCount.toString()),
                          IconButton(
                              icon: Icon(Icons.remove), onPressed: _removeItem),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
