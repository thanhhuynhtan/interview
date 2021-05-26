import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:interview/Model/UserModel.dart';
import 'package:interview/app/bloc/AuthenticateEvent.dart';
import 'package:interview/app/bloc/AuthenticateState.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserModel userModel;

  AuthenticationBloc(this.userModel) : super(Unauthenticated());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await userModel.isSignedIn();
      if (isSignedIn) {
        yield Authenticated(userModel);
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield Authenticated(userModel);
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    await userModel.signOut();
  }
}
