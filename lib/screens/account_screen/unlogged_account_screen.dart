import 'package:flutter/material.dart';
import 'package:internship_project_1/authentication/blocks.dart';
import 'package:internship_project_1/components/tabs_widgets.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/mocks/user_account_mock.dart';
import 'package:internship_project_1/screens/login_screen/login_card.dart';
import 'package:internship_project_1/shared/colors.dart';

class UnloggedAccountScreen extends StatefulWidget {
  static const String id = 'user_account';
  final UserRepository userRepository;

  UnloggedAccountScreen({this.userRepository});

  @override
  _UnloggedAccountScreenState createState() => _UnloggedAccountScreenState();
}

class _UnloggedAccountScreenState extends State<UnloggedAccountScreen> {
  Widget accountTitle({@required String title, Widget description}) {
    return Container(
      padding: EdgeInsets.only(top: 25.0, bottom: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          description
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/account_back.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 50.0,
                              ),
                              child: Text(
                                S.of(context).hello,
                                style: TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.13,
                    )
                  ],
                ),
                Container(
                  padding: new EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      top: MediaQuery.of(context).size.height * 0.20),
                  child: LogInCard(userRepository: widget.userRepository),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              width: double.infinity,
              child: Column(
                children: [
                  accountTitle(
                    title: S.of(context).bonuses,
                    description: Text(
                      S.of(context).bonusInfo,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  TabsDivider(),
                  accountTitle(
                    title: S.of(context).callMe,
                    description: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).callInfo,
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        RichText(
                          text: TextSpan(
                            text: S.of(context).callNumber,
                            style: TextStyle(color: basicBlack, fontSize: 18.0),
                            children: <TextSpan>[
                              TextSpan(
                                  text: accountDetails['callNumber'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  TabsDivider(),
                  SizedBox(height: 15.0)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
