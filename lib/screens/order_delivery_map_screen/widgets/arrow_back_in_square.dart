import 'package:flutter/material.dart';

class ArrowBackInSquare extends StatelessWidget {
  const ArrowBackInSquare({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(0, 0)),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        fixedSize: MaterialStateProperty.all(Size(40, 40)),
        backgroundColor: MaterialStateProperty.all(Color(0xFFF5F5F5)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
      ),
      child: Icon(
        Icons.arrow_back,
        size: 24.0,
        color: Color(0xFF202020),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
