import 'package:interview/Model/SubmissionState.dart';

class RegisterState {
  final String username;
  final String password;
  final String rePassword;
  final SubmissionState submissionState;

  RegisterState({
    this.username = '',
    this.password = '',
    this.rePassword = '',
    this.submissionState = const InitialSubmissionState(),
  });

  //Simple Validation
  bool get isValidUsername => username.length > 3;
  bool get isValidPassword => password.length > 6;
  bool get isValidRePassword => isValidPassword && rePassword == password;

  RegisterState update({
    String? username,
    String? password,
    String? rePassword,
    SubmissionState? submissionState,
  }) {
    return RegisterState(
      username: username ?? this.username,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
      submissionState: submissionState ?? this.submissionState,
    );
  }
}
