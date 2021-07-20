import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/mocks/delivery_map_screens_mock.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/bloc/locations_bloc.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/order_delivery_map_screen.dart';
import 'package:internship_project_1/screens/order_tracking_screen/widgets/delivery_location_map.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationsBloc>(
      create: (context) => LocationsBloc(),
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: Padding(
          padding: EdgeInsets.only(left: 24.0, top: 50.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 18.0),
                              child: Text(S.of(context).orderTracking,
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      color: Color(0xFF202020),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.0,
                                      height: 1.0,
                                    ),
                                  )),
                            ),
                            Text(
                                '${S.of(context).orderNumber} ${deliveryMock['orderNumber']}',
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    color: Color(0xFF202020),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16.0,
                                    height: 1.0,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: -3.0,
                      child: IconButton(
                        constraints: BoxConstraints.tightFor(),
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.arrow_back,
                            size: 24.0, color: Color(0xFF202020)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 18.0),
                          child: Image.asset(
                              'assets/order_tracking_screen/order_check.png'),
                        ),
                        Text(S.of(context).orderAccepted,
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Color(0xFF202020),
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0,
                                height: 1.0,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 18.0),
                          child: Image.asset(
                              'assets/order_tracking_screen/order_check.png'),
                        ),
                        Text(S.of(context).preparingOrder,
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Color(0xFF202020),
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0,
                                height: 1.0,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 18.0),
                          child: Image.asset(
                              'assets/order_tracking_screen/order_check_now.png'),
                        ),
                        Text(S.of(context).readyToGo,
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Color(0xFF202020),
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                                height: 1.0,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 34.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 18.0),
                          child: Image.asset(
                              'assets/order_tracking_screen/order_unchecked.png'),
                        ),
                        Text(S.of(context).orderDelivered,
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Color(0xFF202020),
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0,
                                height: 1.0,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 34.0),
                child: Container(
                  height: 120.0,
                  child: DeliveryLocationMap(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Row(
                  children: [
                    Text(S.of(context).deliveryInfo,
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Color(0xFF202020),
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                            height: 1.0,
                          ),
                        )),
                  ],
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text(deliveryMock['deliveryTime'],
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    color: Color(0xFF202020),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                    height: 1.0,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text(deliveryMock['deliveryDay'],
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    color: Color(0xFF202020),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                    height: 1.0,
                                  ),
                                )),
                          ),
                          Text(deliveryMock['deliveryAddress'],
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: Color(0xFF202020),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  height: 1.0,
                                ),
                              )),
                        ]),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(1.0),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFE5E5E5)),
                        minimumSize: MaterialStateProperty.all(Size(0, 0)),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: Image.asset(
                          'assets/order_tracking_screen/go_to_map.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderDeliveryMapScreen(
                                deliveryLocation:
                                    deliveryMock['deliveryLocation'],
                              ),
                            ));
                      },
                    )
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
