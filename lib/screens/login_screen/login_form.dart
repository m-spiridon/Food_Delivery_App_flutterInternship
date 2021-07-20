import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/authentication/blocks.dart';
import 'package:internship_project_1/components/text_fields.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/home_screen.dart';
import 'package:internship_project_1/screens/registration_screen/registration_screen.dart';
import 'package:internship_project_1/shared/colors.dart';

import 'reser_password.dart';

class LoginForm extends StatefulWidget {
  final UserRepository _userRepository;

  const LoginForm({Key key, UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _loginKey = GlobalKey<FormState>();

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChange);
    _passwordController.addListener(_onPasswordChange);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 50.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.close),
                      ),
                    ),
                    Text(S.of(context).invalidLogIn,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600)),
                    Text(S.of(context).enteredInvalidLogIn,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.0, color: Colors.black, height: 1.5)),
                  ],
                ),
              ),
            ),
          );
        }

        if (state.isSubmitting) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(orange),
              ),
            ),
          );
        }

        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(
            AuthenticationLoggedIn(),
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(selectedIndex: 3)),
              (route) => route.isFirst);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 80.0, bottom: 50.0),
                  child: Text(
                    S.of(context).login,
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700),
                  )),
              Form(
                key: _loginKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EmailTextField(state, emailController: _emailController),
                    SizedBox(
                      height: 20.0,
                    ),
                    PasswordTextField(state,
                        passwordController: _passwordController),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  child: Text(S.of(context).forgotPassword,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600)),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => ResetPasswordDialog(),
                  ),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text(
                    S.of(context).login,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    onSurface: orange,
                    primary: orange,
                    elevation: 0.0,
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                  ),
                  onPressed: (_emailController.text.isEmpty ||
                          _passwordController.text.isEmpty)
                      ? null
                      : () {
                          if (_loginKey.currentState.validate()) {
                            _onFormSubmitted(state);
                          }
                        },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Text(S.of(context).firstTime,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w400))),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return Registration(
                          userRepository: widget._userRepository,
                        );
                      }));
                    },
                    child: Text(
                      S.of(context).signUp,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChange() {
    _loginBloc.add(LoginEmailChange(email: _emailController.text));
  }

  void _onPasswordChange() {
    _loginBloc.add(LoginPasswordChanged(password: _passwordController.text));
  }

  void _onFormSubmitted(state) {
    if (isButtonEnabled(state)) {
      _loginBloc.add(LoginWithCredentialsPressed(
          email: _emailController.text, password: _passwordController.text));
    }
  }
}
