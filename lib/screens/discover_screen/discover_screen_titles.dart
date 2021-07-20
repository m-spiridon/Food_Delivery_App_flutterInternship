import 'package:flutter/material.dart';

class DiscoverScreenTitles extends StatelessWidget {
  const DiscoverScreenTitles({this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 15.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
