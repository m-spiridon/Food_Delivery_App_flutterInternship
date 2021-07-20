import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/shared/px2dpx.dart';

class ItemCard extends StatefulWidget {
  final title;
  final count;
  final image;
  final price;
  final isShopping;

  ItemCard(
      {@required this.title,
      @required this.count,
      @required this.image,
      @required this.isShopping,
      this.price});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    Widget itemsCount() {
      return int.tryParse(widget.count) == 1
          ? Text(widget.count.toString() + " " + S.of(context).recipeItems)
          : Text(widget.count.toString() + " " + S.of(context).items);
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      margin: EdgeInsets.all(convertPx2Dpx(context, 3)),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            child: Image(
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.18,
              image: widget.image == null
                  ? AssetImage('assets/cart_screen/default-product.jpg')
                  : NetworkImage(widget.image),
            ),
          ),
          Container(
            padding: EdgeInsets.all(convertPx2Dpx(context, 4)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                itemsCount(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
