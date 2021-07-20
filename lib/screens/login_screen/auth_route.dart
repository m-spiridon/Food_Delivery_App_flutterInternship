import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/authentication/blocks.dart';
import 'package:internship_project_1/screens/account_screen/unlogged_account_screen.dart';
import 'package:internship_project_1/screens/account_screen/user_account.dart';

class AuthRoute extends StatelessWidget {
  static const String id = 'auth_route';

  final UserRepository _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationFailure) {
          return UnloggedAccountScreen(userRepository: _userRepository);
        }
        if (state is AuthenticationSuccess) {
          return UserAccount(
            email: state.firebaseUser.email,
            name: state.firebaseUser.email,
          );
        }
        return Scaffold(
          body: Container(
            child: Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )),
          ),
        );
      },
    );
  }
}
