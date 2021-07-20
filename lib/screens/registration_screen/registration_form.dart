import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/authentication/blocks.dart';
import 'package:internship_project_1/components/text_fields.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/home_screen.dart';
import 'package:internship_project_1/screens/login_screen/login_screen.dart';
import 'package:internship_project_1/shared/colors.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _postCodeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _registrationKey = GlobalKey<FormState>();

  bool get isPopulated =>
      _emailController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty &&
      _postCodeController.text.isNotEmpty;

  bool isButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChange);
    _passwordController.addListener(_onPasswordChange);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isFailure) {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(S.of(context).registerFailure),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Colors.blue,
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
      child:
          BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Text(
                  S.of(context).signUp,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700),
                )),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _registrationKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      EmailTextField(state, emailController: _emailController),
                      SizedBox(
                        height: 20.0,
                      ),
                      PasswordTextField(state,
                          passwordController: _passwordController),
                      SizedBox(
                        height: 20.0,
                      ),
                      PostCodeTextField(
                        postCodeController: _postCodeController,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onSurface: orange,
                            primary: orange,
                            elevation: 0.0,
                            padding: EdgeInsets.symmetric(
                              vertical: 15.0,
                            ),
                          ),
                          onPressed: (_emailController.text.isEmpty ||
                                  _passwordController.text.isEmpty ||
                                  _postCodeController.text.isEmpty)
                              ? null
                              : () {
                                  if (_registrationKey.currentState
                                      .validate()) {
                                    _onFormSubmitted(state);
                                  }
                                },
                          child: Text(S.of(context).signUpWithEmail,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              child: Text(S.of(context).alreadyHaveAccount,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400))),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, LoginScreen.id);
                            },
                            child: Text(
                              S.of(context).login,
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
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _postCodeController.dispose();
    super.dispose();
  }

  void _onEmailChange() {
    _registerBloc.add(RegisterEmailChanged(email: _emailController.text));
  }

  void _onPasswordChange() {
    _registerBloc
        .add(RegisterPasswordChanged(password: _passwordController.text));
  }

  void _onFormSubmitted(state) {
    if (isButtonEnabled(state)) {
      _registerBloc.add(RegisterSubmitted(
          email: _emailController.text, password: _passwordController.text));
    }
  }
}
