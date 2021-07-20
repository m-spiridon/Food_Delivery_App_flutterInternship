import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/mocks/delivery_details.dart';

class DeliverydeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Image.asset(
                          'images/delivery_details_back.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      AppBar(
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).categoryDeliveryInfo,
                          style: TextStyle(
                              fontSize: 26.0, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          deliveryDetails['workHours'],
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          deliveryDetails['daysOff'],
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          deliveryDetails['orderSummary'],
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          deliveryDetails['payment'],
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(height: 18.0),
                        Text(
                          deliveryDetails['returnCash'],
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
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
                  S.of(context).approximateDeliveryTime,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              subtitle: Text(
                deliveryDetails['deliveryTime'],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
