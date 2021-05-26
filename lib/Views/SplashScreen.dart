import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: 100.h,
          width: 100.w,
          color: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/image/login_background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 10.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/image/login_logo.png"),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: 11.h,
                  width: 100.w,
                  child: Center(
                    child: CircularProgressIndicator(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
