import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_1/authentication/blocs/register_bloc/register_event.dart';
import 'package:internship_project_1/authentication/blocs/register_bloc/register_state.dart';
import 'package:internship_project_1/authentication/user_repository.dart';
import 'package:internship_project_1/shared/regex.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({UserRepository userRepository})
      : _userRepository = userRepository,
        super(RegisterState.initial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterEmailChanged) {
      yield* _mapRegisterEmailChangeToState(event.email);
    } else if (event is RegisterPasswordChanged) {
      yield* _mapRegisterPasswordChangeToState(event.password);
    } else if (event is RegisterSubmitted) {
      yield* _mapRegisterSubmittedToState(
          email: event.email, password: event.password);
    }
  }

  Stream<RegisterState> _mapRegisterEmailChangeToState(String email) async* {
    yield state.update(
        isEmailValid: AuthenticationValidators.isValidEmail(email));
  }

  Stream<RegisterState> _mapRegisterPasswordChangeToState(
      String password) async* {
    yield state.update(
        isPasswordValid: AuthenticationValidators.isValidPassword(password));
  }

  Stream<RegisterState> _mapRegisterSubmittedToState(
      {String email, String password}) async* {
    yield RegisterState.loading();
    try {
      await _userRepository.signUp(email, password);
      yield RegisterState.success();
    } catch (error) {
      print(error);
      yield RegisterState.failure();
    }
  }
}
