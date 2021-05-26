import 'package:interview/Model/UserModel.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final UserModel userModel;

  Authenticated(this.userModel);
}

class Unauthenticated extends AuthenticationState {}
