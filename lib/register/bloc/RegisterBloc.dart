import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:interview/register/bloc/RegisterEvent.dart';
import 'package:interview/register/bloc/RegisterState.dart';
import 'package:interview/Model/SubmissionState.dart';
import 'package:interview/Model/UserModel.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserModel userModel;

  RegisterBloc(this.userModel) : super(RegisterState());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterUsernameChanged) {
      yield state.update(username: event.username);
    } else if (event is RegisterPasswordChanged) {
      yield state.update(password: event.password);
    } else if (event is RegisterRePasswordChanged) {
      yield state.update(rePassword: event.rePassword);
    } else if (event is RegisterSubmitted) {
      yield* _mapRegisterWithSubmitedToState(state.username, state.password);
    }
  }

  Stream<RegisterState> _mapRegisterWithSubmitedToState(
      String username, String password) async* {
    yield state.update(submissionState: SubmissionLoading());
    try {
      await userModel.signUp(username: username, password: password);
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
