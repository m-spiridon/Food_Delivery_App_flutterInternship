import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/discover_screen/delivery_details/delivety_details_screen.dart';

class DeliveryDetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        color: Colors.white,
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DeliverydeliveryScreen()));
        },
        contentPadding: EdgeInsets.all(12.0),
        leading: Container(
          height: double.infinity,
          child: Icon(
            Icons.date_range_outlined,
            size: 28.0,
            color: Colors.black,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            S.of(context).deliveryDetails,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        subtitle: Text(
          S.of(context).bestTime,
          style: TextStyle(
              color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_down,
          size: 36.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
