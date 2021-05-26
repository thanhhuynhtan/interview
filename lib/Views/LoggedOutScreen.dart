import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview/Bloc/AuthenticationBloc.dart';
import 'package:interview/Bloc/LoginBloc.dart';
import 'package:interview/Model/UserModel.dart';
import 'package:interview/Utils/SizeTransitionRoute.dart';
import 'package:interview/Utils/TwitterAvatarTag.dart';
import 'package:interview/Utils/localization.dart';
import 'package:interview/Views/LoginScreen.dart';
import 'package:interview/Views/RegisterScreen.dart';
import 'package:sizer/sizer.dart';

class LoggedOutScreen extends StatefulWidget {
  @override
  _LoggedOutScreenState createState() => _LoggedOutScreenState();
}

class _LoggedOutScreenState extends State<LoggedOutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: 100.h,
          width: 100.w,
          color: Colors.white,
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
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 4.w,
                            bottom: 2.h,
                          ),
                          child: TwitterAvatarTag(
                            asset: "assets/image/login_avar.png",
                            name: "Pawel Czerwinski",
                            tag: "@pawel_czerwinski",
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 7.h,
                      width: 43.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          width: 2.0,
                          color: Colors.black,
                        ),
                      ),
                      child: TextButton(
                        child: Center(
                          child: Text(
                              AppLocalization.of(context)!
                                  .translate('Login.Login')
                                  .toUpperCase(),
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 11.0.sp,
                                fontWeight: FontWeight.w900,
                              )),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            SizeTransitionRoute(
                              LoginScreen(
                                userModel: context.read<UserModel>(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 7.h,
                      width: 43.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.black,
                      ),
                      child: TextButton(
                        child: Center(
                          child: Text(
                            AppLocalization.of(context)!
                                .translate('Login.Register')
                                .toUpperCase(),
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 11.0.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            SizeTransitionRoute(
                              RegisterScreen(
                                userModel: context.read<UserModel>(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
