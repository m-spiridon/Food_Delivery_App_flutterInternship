import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/models/cart_item.dart';
import 'package:internship_project_1/screens/cart_screen/bloc/cart_bloc.dart';
import 'package:internship_project_1/screens/cart_screen/bloc/cart_event.dart';
import 'package:internship_project_1/screens/product_screen/product_provider.dart';
import 'package:internship_project_1/shared/colors.dart';

class SingleProductCard extends StatelessWidget {
  final int id;
  final String title;
  final String subtitle;
  final String amount;
  final double price;
  final String image;
  final bool isHorizontal;

  SingleProductCard(
      {@required this.id,
      @required this.title,
      this.subtitle,
      this.amount,
      @required this.price,
      @required this.image,
      @required this.isHorizontal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductBuilder(
                      id: id,
                      title: title,
                    )));
      },
      child: isHorizontal
          ? Container(
              height: MediaQuery.of(context).size.height * 0.25,
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  ImagePart(image: image),
                  BodyPart(
                      id: id,
                      title: title,
                      subtitle: subtitle,
                      amount: amount,
                      price: price,
                      isHorizontal: isHorizontal)
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 10.0),
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  ImagePart(image: image),
                  BodyPart(
                      id: id,
                      title: title,
                      subtitle: subtitle,
                      amount: amount,
                      price: price,
                      isHorizontal: isHorizontal)
                ],
              ),
            ),
    );
  }
}

class BodyPart extends StatelessWidget {
  final int id;
  final String title;
  final String subtitle;
  final String amount;
  final double price;
  final bool isHorizontal;

  BodyPart(
      {@required this.id,
      @required this.title,
      @required this.subtitle,
      @required this.amount,
      @required this.price,
      @required this.isHorizontal});

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);

    return Expanded(
      flex: isHorizontal ? 5 : 3,
      child: Padding(
        padding: isHorizontal
            ? EdgeInsets.only(left: 15.0)
            : EdgeInsets.only(top: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                isHorizontal
                    ? Text(
                        amount,
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w300),
                      )
                    : SizedBox(),
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${S.of(context).currency}$price',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: S.of(context).toastMsgForSingleProduct(title),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        fontSize: 16.0,
                      );
                      cartBloc.add(CartAddItemEvent(CartItem(
                        productId: id,
                        quantity: 1,
                      )));
                    },
                    child: Text(
                      S.of(context).addBtnText,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: orange,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImagePart extends StatefulWidget {
  final String image;

  ImagePart({this.image});

  @override
  _ImagePartState createState() => _ImagePartState();
}

class _ImagePartState extends State<ImagePart> {
  var isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        width: double.infinity,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          image: DecorationImage(
              image: NetworkImage(
                widget.image,
              ),
              fit: BoxFit.cover),
        ),
        child: IconButton(
            icon: isFavorite == false
                ? Icon(Icons.favorite_outline)
                : Icon(Icons.favorite),
            iconSize: 30.0,
            color: orange,
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            }),
      ),
    );
  }
}
