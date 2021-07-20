import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/profile_details/profile_details_body.dart';

class ProfileDetailsScreen extends StatelessWidget {
  static const String id = "profile_details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).profileDetailsScreenAppBarTitle,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
          ),
          onPressed: () => Navigator.of(context).pop(null),
        ),
      ),
      body: ProfileDetailsBody(),
    );
  }
}
