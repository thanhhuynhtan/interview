import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview/Bloc/AuthenticationBloc.dart';
import 'package:interview/Bloc/RegisterBloc.dart';
import 'package:interview/Model/AuthenticateEvent.dart';
import 'package:interview/Model/RegisterEvent.dart';
import 'package:interview/Model/RegisterState.dart';
import 'package:interview/Model/SubmissionState.dart';
import 'package:interview/Model/UserModel.dart';
import 'package:interview/Utils/SnackBar.dart';
import 'package:interview/Utils/localization.dart';
import 'package:interview/Utils/InputField.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  final UserModel userModel;

  const RegisterScreen({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = RegisterBloc(widget.userModel);
  }

  Widget buildSubmitButton(RegisterState state) {
    return Container(
      height: 7.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
      child: (state.submissionState is SubmissionLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : MaterialButton(
              child: Center(
                child: Text(
                  AppLocalization.of(context)!
                      .translate("Login.Register")
                      .toUpperCase(),
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _registerBloc.add(RegisterSubmitted());
                }
              },
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<RegisterBloc, RegisterState>(
          bloc: _registerBloc,
          listener: (BuildContext context, RegisterState state) {
            final submitStatus = state.submissionState;
            if (submitStatus is SubmissionFailed) {
              showSnackBar(context, submitStatus.exception.toString());
            } else if (submitStatus is SubmissionSuccess) {
              Navigator.of(context).pop();
              context.read<AuthenticationBloc>().add(LoggedIn());
            }
          },
          child: BlocBuilder<RegisterBloc, RegisterState>(
            bloc: _registerBloc,
            builder: (BuildContext context, RegisterState state) {
              return Container(
                height: 100.h,
                width: 100.w,
                padding: EdgeInsets.symmetric(
                  vertical: 2.h,
                  horizontal: 4.w,
                ),
                color: Colors.white,
                child: Form(
                  key: _formKey,
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
                          AppLocalization.of(context)!
                              .translate('Login.Register'),
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
                          validator: (value) =>
                              state.isValidUsername ? null : "Invalid Username",
                          onChanged: (value) =>
                              _registerBloc.add(RegisterUsernameChanged(value)),
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
                          validator: (value) =>
                              state.isValidPassword ? null : "Invalid Password",
                          onChanged: (value) =>
                              _registerBloc.add(RegisterPasswordChanged(value)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 2.h,
                        ),
                        child: inputField(
                          controller: _repasswordController,
                          hintText: "Re-input Password",
                          obscure: true,
                          validator: (value) =>
                              state.isValidRePassword ? null : "Incorrect",
                          onChanged: (value) => _registerBloc
                              .add(RegisterRePasswordChanged(value)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 3.h,
                        ),
                        child: buildSubmitButton(state),
                      ),
                      Html(
                        data: AppLocalization.of(context)!
                            .translate('Login.Term'),
                        style: {
                          "body": Style(
                            fontSize: FontSize(18.0),
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontFamily: "roboto",
                          ),
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
