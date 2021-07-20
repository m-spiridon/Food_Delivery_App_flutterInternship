import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/order_summary/order_summary_body.dart';

class OrderSummaryScreen extends StatelessWidget {
  static const String id = "order_summary_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).orderSummaryScreenAppBarTitle),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: OrderSummaryBody(),
    );
  }
}
