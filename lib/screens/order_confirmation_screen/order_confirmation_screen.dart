import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/mocks/delivery_map_screens_mock.dart';
import 'package:internship_project_1/screens/order_delivery_map_screen/bloc/locations_bloc.dart';
import 'package:internship_project_1/screens/order_tracking_screen/order_tracking_screen.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationsBloc>(
      create: (context) => LocationsBloc(),
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.0, top: 50.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(S.of(context).orderConfirmation,
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      color: Color(0xFF202020),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.0,
                                      height: 1.0,
                                    ),
                                  )),
                            ],
                          ),
                          Positioned(
                            top: -3.0,
                            left: 0,
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
                      SizedBox(height: 16.0),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          '${S.of(context).thanksForYourOrder} ${deliveryMock['userName']}!',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Color(0xFF202020),
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                              height: 1.0,
                            ),
                          )),
                      SizedBox(height: 8.0),
                      Text(S.of(context).courierCall,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: Color(0xFF202020),
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0,
                              height: 1.5,
                            ),
                          )),
                      SizedBox(height: 8.0),
                      Image.asset(
                          'assets/order_tracking_screen/order_check_now.png'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 16.0),
                      Divider(
                        color: Color(0xFFE0E0E0),
                        height: 2.0,
                        thickness: 2.0,
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).orderDetails,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Color(0xFF726F6F),
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              height: 1.0,
                            ),
                          )),
                      SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(S.of(context).date,
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: Color(0xFF202020),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                  height: 1.0,
                                ),
                              )),
                          SizedBox(width: 7.0),
                          Text(deliveryMock['deliveryDay'],
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: Color(0xFF202020),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0,
                                  height: 1.0,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(S.of(context).date,
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: Color(0xFF202020),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                  height: 1.0,
                                ),
                              )),
                          SizedBox(width: 7.0),
                          Text('\$${deliveryMock['orderSum']}',
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: Color(0xFF202020),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0,
                                  height: 1.0,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(S.of(context).deliveryTime,
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: Color(0xFF202020),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                  height: 1.0,
                                ),
                              )),
                          SizedBox(width: 7.0),
                          Text('${deliveryMock['deliveryTime']}',
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: Color(0xFF202020),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0,
                                  height: 1.0,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 16.0),
                      Divider(
                        color: Color(0xFFE0E0E0),
                        height: 2.0,
                        thickness: 2.0,
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).emailConfirmation,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Color(0xFF726F6F),
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              height: 1.0,
                            ),
                          )),
                      SizedBox(height: 8.0),
                      Text(deliveryMock['userEmail'],
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: Color(0xFF202020),
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                              height: 1.0,
                            ),
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 16.0),
                      Divider(
                        color: Color(0xFFE0E0E0),
                        height: 2.0,
                        thickness: 2.0,
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).needHelp,
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Color(0xFF726F6F),
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                              height: 1.0,
                            ),
                          )),
                      SizedBox(height: 8.0),
                      Text(deliveryMock['supportPhone'],
                          style: GoogleFonts.nunito(
                            textStyle: TextStyle(
                              color: Color(0xFF202020),
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                              height: 1.0,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                color: Color(0xFFFBFBFB),
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(24.0, 15.0, 24.0, 32.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(0, 0)),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    fixedSize:
                        MaterialStateProperty.all(Size(double.infinity, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFEF9D3A)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0))),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderTrackingScreen(),
                        ));
                  },
                  child: Text(S.of(context).trackOrder,
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                          height: 1.0,
                        ),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
