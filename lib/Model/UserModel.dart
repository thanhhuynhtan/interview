import 'dart:async';

class UserModel {
  late String? _username;
  late String? _password;

  Future<void> signIn({
    required String username,
    required String password,
  }) async {
    _username = username;
    _password = password;
    await Future.delayed(
      Duration(seconds: 1),
    );
  }

  Future<void> signUp({
    required String username,
    required String password,
  }) async {
    _username = username;
    _password = password;
    await Future.delayed(
      Duration(seconds: 1),
    );
  }

  Future<void> signOut() async {
    _username = null;
    _password = null;
    await Future.delayed(
      Duration(seconds: 1),
    );
  }

  //Check if an account is already logged in and is saved for next login
  //Default false for testing login
  Future<bool> isSignedIn() async {
    await Future.delayed(
      Duration(seconds: 1),
    );
    return false;
    //return _username == null && _password == null;
  }

  Future<String> getUser() async {
    await Future.delayed(
      Duration(seconds: 1),
    );
    return _username ?? "";
  }
}
