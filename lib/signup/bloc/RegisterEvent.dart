import 'package:meta/meta.dart';

@immutable
abstract class RegisterEvent {}

class RegisterUsernameChanged extends RegisterEvent {
  final String username;
  RegisterUsernameChanged(this.username);
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;
  RegisterPasswordChanged(this.password);
}

class RegisterRePasswordChanged extends RegisterEvent {
  final String rePassword;
  RegisterRePasswordChanged(this.rePassword);
}

class RegisterSubmitted extends RegisterEvent {}
