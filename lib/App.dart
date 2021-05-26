import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:interview/Bloc/AuthenticationBloc.dart';
import 'package:interview/Model/UserModel.dart';
import 'package:interview/Model/AuthenticateEvent.dart';
import 'package:interview/Model/AuthenticateState.dart';
import 'package:interview/Utils/localization.dart';
import 'package:interview/Views/HomeScreen.dart';
import 'package:interview/Views/LoggedOutScreen.dart';
import 'package:interview/Views/SplashScreen.dart';
import 'package:sizer/sizer.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final UserModel _userModel = UserModel();
  late AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc(_userModel);
    _authenticationBloc.add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _authenticationBloc,
      child: RepositoryProvider(
        create: (BuildContext context) => _userModel,
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              supportedLocales: [
                Locale('en', 'US'),
                Locale('vi', 'VN'),
              ],
              localizationsDelegates: [
                AppLocalization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              localeListResolutionCallback: (locale, supportedLocales) {
                if (locale != null) {
                  for (var supportedLocale in supportedLocales) {
                    if (supportedLocale.languageCode ==
                            locale.first.languageCode &&
                        supportedLocale.countryCode ==
                            locale.first.countryCode) {
                      return supportedLocale;
                    }
                  }
                }
                return supportedLocales.first;
              },
              home: BlocBuilder(
                bloc: _authenticationBloc,
                builder: (BuildContext context, AuthenticationState state) {
                  if (state is Authenticated) {
                    return HomeScreen();
                  } else if (state is Unauthenticated) {
                    return LoggedOutScreen();
                  }
                  return SplashScreen();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}