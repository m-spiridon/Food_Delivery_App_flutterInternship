import 'package:flutter/material.dart';
import 'package:internship_project_1/authentication/blocks.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/login_screen/login_screen.dart';
import 'package:internship_project_1/screens/registration_screen/registration_screen.dart';
import 'package:internship_project_1/shared/colors.dart';

class LogInCard extends StatelessWidget {
  const LogInCard({
    Key key,
    @required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(key: key);

  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(S.of(context).logInForMoreFunctional,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                  builder: (context) => LoginScreen(
                        userRepository: _userRepository,
                      )));
            },
            child: Text(
              S.of(context).login,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            style: TextButton.styleFrom(
                backgroundColor: orange,
                padding: EdgeInsets.symmetric(vertical: 15.0)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).isHaveAccount,
                  style: TextStyle(fontSize: 16.0)),
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (_) {
                    return Registration(
                      userRepository: _userRepository,
                    );
                  }));
                },
                child: Text(
                  S.of(context).signUpNow,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
