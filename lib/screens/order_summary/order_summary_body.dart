import 'package:flutter/material.dart';
import 'package:internship_project_1/components/categories/category_name.dart';
import 'package:internship_project_1/components/tabs_widgets.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/order_confirmation_screen/order_confirmation_screen.dart';
import 'package:internship_project_1/screens/order_summary/order_data.dart';
import 'package:internship_project_1/shared/colors.dart';

class OrderSummaryBody extends StatelessWidget {
  Widget _billRow(context, service, price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            service,
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            S.of(context).currency + price,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  Widget _bill(context, bill) {
    return Column(
      children: bill
          .map<Widget>(
            (it) => _billRow(
              context,
              it["service"],
              it["price"],
            ),
          )
          .toList(),
    );
  }

  Widget _paymentInfo(context, bill) {
    return Column(
      children: [
        _bill(context, bill),
        TabsDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            S.of(context).addPromoCodeOrGiftCard,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TabsDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).subTotal,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text(
                S.of(context).currency + subTotal,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.0),
              ),
            ],
          ),
        ),
        TabsDivider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryName(name: S.of(context).categoryDeliverySlot),
                  TabsDivider(),
                  DetailsTab(
                    title: date + time,
                    icon: Icons.calendar_today_outlined,
                  ),
                  TabsDivider(),
                  SizedBox(height: 10.0),
                  CategoryName(name: S.of(context).categoryDeliveryInfo),
                  TabsDivider(),
                  DetailsTab(
                      title: S.of(context).optionAddress,
                      subTitle: S.of(context).deliveryAddress,
                      icon: Icons.location_on_outlined),
                  TabsDivider(),
                  SizedBox(height: 10.0),
                  CategoryName(name: S.of(context).categoryPaymentDetails),
                  TabsDivider(),
                  DetailsTab(
                      title: S.of(context).paymentOnDelivery,
                      icon: Icons.credit_card_rounded),
                  TabsDivider(),
                  SizedBox(
                    height: 15.0,
                  ),
                  _paymentInfo(context, bill),
                  SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          color: Colors.white,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderConfirmationScreen(),
                ),
              );
            },
            style: TextButton.styleFrom(
                backgroundColor: orange,
                padding: EdgeInsets.symmetric(vertical: 10.0)),
            child: Text(
              S.of(context).completeOrder,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        )
      ],
    );
  }
}
