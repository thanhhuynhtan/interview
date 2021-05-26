import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:interview/Model/LoginEvent.dart';
import 'package:interview/Model/LoginState.dart';
import 'package:interview/Model/SubmissionState.dart';
import 'package:interview/Model/UserModel.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserModel userModel;

  LoginBloc(this.userModel) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUsernameChanged) {
      yield state.update(username: event.username);
    } else if (event is LoginPasswordChanged) {
      yield state.update(password: event.password);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginWithSubmitedToState(state.username, state.password);
    }
  }

  Stream<LoginState> _mapLoginWithSubmitedToState(
      String username, String password) async* {
    yield state.update(submissionState: SubmissionLoading());
    try {
      userModel.signIn(username: username, password: password);
      yield state.update(submissionState: SubmissionSuccess());
    } catch (error) {
      yield state.update(
        submissionState: SubmissionFailed(
          Exception(
            error,
          ),
        ),
      );
    }
  }
}
