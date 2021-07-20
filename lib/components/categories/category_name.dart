import 'package:flutter/material.dart';

class CategoryName extends StatelessWidget {
  final name;

  const CategoryName({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),
      ),
    );
  }
}
