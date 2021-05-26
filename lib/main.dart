import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview/app/view/App.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(App());
  });
}
