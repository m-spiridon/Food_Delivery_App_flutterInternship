import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/authentication/blocks.dart';
import 'package:internship_project_1/screens/registration_screen/registration_form.dart';

class Registration extends StatelessWidget {
  final UserRepository _userRepository;

  const Registration({Key key, UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/login_screen.png'),
            alignment: Alignment.bottomCenter,
            fit: BoxFit.cover,
          )),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          //extendBodyBehindAppBar: true,
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
                }),
          ),
          // resizeToAvoidBottomInset: false,
          body: BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(userRepository: _userRepository),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: RegistrationForm(),
            ),
          ),
        ),
      ],
    );
  }
}
