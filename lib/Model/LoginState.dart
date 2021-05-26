import 'package:interview/Model/SubmissionState.dart';

class LoginState {
  final String username;
  final String password;
  final SubmissionState submissionState;

  LoginState({
    this.username = '',
    this.password = '',
    this.submissionState = const InitialSubmissionState(),
  });

  //Simple Validation
  bool get isValidUsername => username.length > 3;
  bool get isValidPassword => password.length > 6;

  LoginState update({
    String? username,
    String? password,
    SubmissionState? submissionState,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      submissionState: submissionState ?? this.submissionState,
    );
  }
}
