import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/mocks/delivery_map_screens_mock.dart';

class DeliveryStatusBar extends StatelessWidget {
  const DeliveryStatusBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24.0, 35.0, 24.0, 32.0),
      height: 170.0,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFF5F5F5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${S.of(context).yourOrder} ${deliveryMock['orderNumber']}',
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Color(0xFFEF9D3A),
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  )),
              Image.asset(
                'assets/delivery_map_screen/truck.png',
                height: 24.0,
                width: 24.0,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 11.0),
                      child: Text('${S.of(context).accepted}',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Color(0xFF202020),
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 11.0),
                      child: Stack(clipBehavior: Clip.none, children: [
                        Container(
                          color: Color(0xFFEF9D3A),
                          child: SizedBox(
                            width: double.infinity,
                            height: 2.0,
                          ),
                        ),
                        Positioned(
                          top: -3.0,
                          child: ClipOval(
                            child: Container(
                                color: Color(0xFFEF9D3A),
                                child: SizedBox(width: 8.0, height: 8.0)),
                          ),
                        )
                      ]),
                    ),
                    Text(deliveryMock['acceptedTime'],
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Color(0xFF202020),
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 11.0),
                      child: Text('${S.of(context).prepared}',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Color(0xFF202020),
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 11.0),
                      child: Stack(clipBehavior: Clip.none, children: [
                        Container(
                          color: Color(0xFFEF9D3A),
                          child: SizedBox(
                            width: double.infinity,
                            height: 2.0,
                          ),
                        ),
                        Positioned(
                          top: -3.0,
                          child: ClipOval(
                            child: Container(
                                color: Color(0xFFEF9D3A),
                                child: SizedBox(width: 8.0, height: 8.0)),
                          ),
                        )
                      ]),
                    ),
                    Text(deliveryMock['preparedTime'],
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Color(0xFF202020),
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 11.0),
                      child: Text('${S.of(context).ready}',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Color(0xFF202020),
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 11.0),
                      child: Stack(clipBehavior: Clip.none, children: [
                        Container(
                          color: Color(0xFFEF9D3A),
                          child: SizedBox(
                            width: double.infinity,
                            height: 2.0,
                          ),
                        ),
                        Positioned(
                          top: -3.0,
                          child: ClipOval(
                            child: Container(
                                color: Color(0xFFEF9D3A),
                                child: SizedBox(width: 8.0, height: 8.0)),
                          ),
                        )
                      ]),
                    ),
                    Text(deliveryMock['readyTime'],
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Color(0xFF202020),
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 11.0),
                      child: Text('${S.of(context).delivered}',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Color(0xFF202020),
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 11.0),
                      child: Stack(clipBehavior: Clip.none, children: [
                        Container(
                          color: Color(0xFF898A8D),
                          child: SizedBox(
                            width: double.infinity,
                            height: 2.0,
                          ),
                        ),
                        Positioned(
                          top: -3.0,
                          child: ClipOval(
                            child: Container(
                                color: Color(0xFF898A8D),
                                child: SizedBox(width: 8.0, height: 8.0)),
                          ),
                        )
                      ]),
                    ),
                    Text(deliveryMock['deliveryTime'],
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Color(0xFF202020),
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
