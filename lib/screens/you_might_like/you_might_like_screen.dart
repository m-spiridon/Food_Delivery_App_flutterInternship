import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/you_might_like/you_might_like_body.dart';

class YouMightLikeScreen extends StatelessWidget {
  static const String id = "you_might_like_like";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).youMightLikeScreenAppBarTitle,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.close,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: YouMightLikeBody(),
    );
  }
}
