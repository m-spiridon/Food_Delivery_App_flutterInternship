import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/authentication/blocks.dart';
import 'package:internship_project_1/screens/login_screen/login_form.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  static const String id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 26.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              })),
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => LoginBloc(userRepository: _userRepository),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/login_screen.png'),
              alignment: Alignment.bottomCenter,
              fit: BoxFit.cover,
            )
          ),
          padding: EdgeInsets.all(20.0),
          child: LoginForm(userRepository: _userRepository),
        ),
      ),
    );
  }
}
