import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/authentication/blocks.dart';
import 'package:internship_project_1/components/tabs_widgets.dart';
import 'package:internship_project_1/components/view_all_btn.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/mocks/user_account_mock.dart';
import 'package:internship_project_1/screens/account_screen/shopping_screen/shopping_screen.dart';
import 'package:internship_project_1/screens/account_screen/your_orders_screen/your_orders_screen.dart';
import 'package:internship_project_1/screens/profile_details/profile_details_screen.dart';
import 'package:internship_project_1/shared/colors.dart';

class UserAccount extends StatefulWidget {
  static const String id = 'user_account';
  final String name;
  final String address;
  final String email;
  final String paymentType;
  final List<String> orders;

  UserAccount({
    @required this.name,
    this.address,
    @required this.email,
    this.paymentType,
    this.orders,
  });

  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  Widget _shortInfo(BuildContext context, String obj, IconData icon) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProfileDetailsScreen()));
      },
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(width: 10.0),
          Text(
            '$obj',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget exit() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        BlocProvider.of<AuthenticationBloc>(context)
            .add(AuthenticationLoggedOut());
      },
    );
  }

  Widget accountTitle(
      {@required String title, Widget description, Widget redirect}) {
    return Container(
      padding: EdgeInsets.only(top: 25.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
              (redirect != null)
                  ? ViewAllBtn(
                      onClick: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => redirect));
                      },
                    )
                  : Container(),
            ],
          ),
          (description != null)
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: description,
                )
              : Container(),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 30.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).hello,
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.exit_to_app,
                              ),
                              onPressed: () {
                                BlocProvider.of<AuthenticationBloc>(context)
                                    .add(AuthenticationLoggedOut());
                              },
                            )
                          ],
                        ),
                      ),
                      (widget.address == null)
                          ? _shortInfo(
                              context,
                              S.of(context).noAdress,
                              Icons.location_on_outlined,
                            )
                          : _shortInfo(
                              context,
                              widget.address,
                              Icons.location_on_outlined,
                            ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0, bottom: 25.0),
                        child: _shortInfo(
                          context,
                          widget.email,
                          Icons.email_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            child: Column(
              children: [
                accountTitle(
                  title: S.of(context).yourOrders,
                  redirect: YourOrders(),
                ),
                TabsDivider(),
                accountTitle(
                  title: 'Favourites',
                  redirect: ShoppingScreen(),
                ),
                TabsDivider(),
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
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
          ),
        ],
      ),
    ));
  }
}
