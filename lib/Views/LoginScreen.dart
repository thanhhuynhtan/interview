import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview/Utils/localization.dart';
import 'package:interview/Utils/InputField.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: 100.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(
            vertical: 2.h,
            horizontal: 4.w,
          ),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 5.h,
                width: 5.h,
                child: Center(
                  child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 2.5.h,
                      width: 2.5.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icon/back.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              Container(
                height: 14.h,
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalization.of(context)!.translate('Login.Login'),
                  style: GoogleFonts.comfortaa(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 30.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 2.h,
                ),
                child: inputField(
                  controller: _usernameController,
                  hintText: "Username",
                  obscure: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 2.h,
                ),
                child: inputField(
                  controller: _passwordController,
                  hintText: "Password",
                  obscure: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 3.h,
                ),
                child: Container(
                  height: 8.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      AppLocalization.of(context)!
                          .translate("Login.Login")
                          .toUpperCase(),
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
