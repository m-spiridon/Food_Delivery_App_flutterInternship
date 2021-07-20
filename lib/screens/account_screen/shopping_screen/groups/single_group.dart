import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/account_screen/shopping_screen/product/product_list.dart';
import 'package:internship_project_1/shared/px2dpx.dart';

class SingleGroup extends StatefulWidget {
  final name;
  final items;
  SingleGroup({@required this.name, @required this.items});

  @override
  _SingleGroupState createState() => _SingleGroupState();
}

class _SingleGroupState extends State<SingleGroup> {
  int get count {
    return widget.items.length;
  }

  Widget TextAndIconButton(
    BuildContext context,
    String text,
    IconData icon,
    Function action,
  ) {
    return TextButton(
      onPressed: action,
      child: Row(
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }

  double totalPrice = 0.0;

  void getTotalPrice() {
    for (int i = 0; i < widget.items.length; i++) {
      double itemPrice = widget.items[i]['price'];

      totalPrice += itemPrice;
    }
  }

  @override
  void initState() {
    getTotalPrice();

    super.initState();
  }

  Widget ModalWindow(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: convertPx2Dpx(context, 3),
            vertical: convertPx2Dpx(context, 6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.name),
            TextAndIconButton(
                context, S.of(context).renameList, Icons.edit, null),
            TextAndIconButton(
                context, S.of(context).deleteList, Icons.delete, null),
            Center(
              child: TextButton(
                child: Text(S.of(context).cancel),
                onPressed: () => Navigator.pop(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var itemsCount = Text(count.toString() + " " + S.of(context).items);
    return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        color: Colors.white,
        padding: EdgeInsets.all(convertPx2Dpx(context, 3)),
        margin: EdgeInsets.symmetric(
            horizontal: convertPx2Dpx(context, 6),
            vertical: convertPx2Dpx(context, 3)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return ModalWindow(context);
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.edit),
                      Text(S.of(context).edit),
                    ],
                  ),
                ),
                Text(
                  widget.name,
                  style: TextStyle(fontSize: convertPx2Dpx(context, 7)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductList(
                                title: widget.name,
                                products: widget.items,
                                totalPrice: getTotalPrice,
                              )),
                    );
                  },
                  child: Text(S.of(context).view),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        vertical: convertPx2Dpx(context, 1),
                        horizontal: convertPx2Dpx(context, 4)),
                    width: convertPx2Dpx(context, 25),
                    child: FittedBox(
                      child: Image.network(widget.items[index]['image']),
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: convertPx2Dpx(context, 20)),
                itemsCount,
                RichText(
                  text: TextSpan(
                    text: 'Total: ',
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                          text: totalPrice.toStringAsFixed(2),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: convertPx2Dpx(context, 4)),
              child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Center(child: Text(S.of(context).addAll)),
                ),
              ),
            )
          ],
        ));
  }
}
