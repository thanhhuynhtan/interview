import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:interview/Utils/localization.dart';
import 'package:interview/Views/HomeScreen.dart';
import 'package:interview/Views/LoggedOutScreen.dart';
import 'package:interview/Views/RegisterScreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
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
                if (supportedLocale.languageCode == locale.first.languageCode &&
                    supportedLocale.countryCode == locale.first.countryCode) {
                  return supportedLocale;
                }
              }
            }
            return supportedLocales.first;
          },
          home: HomeScreen(),
        );
      },
    );
  }
}
