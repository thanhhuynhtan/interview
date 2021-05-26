import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview/Bloc/AuthenticationBloc.dart';
import 'package:interview/Bloc/LoginBloc.dart';
import 'package:interview/Model/AuthenticateEvent.dart';
import 'package:interview/Model/AuthenticateState.dart';
import 'package:interview/Model/LoginEvent.dart';
import 'package:interview/Model/LoginState.dart';
import 'package:interview/Model/SubmissionState.dart';
import 'package:interview/Model/UserModel.dart';
import 'package:interview/Utils/SnackBar.dart';
import 'package:interview/Utils/localization.dart';
import 'package:interview/Utils/InputField.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  final UserModel userModel;

  const LoginScreen({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(widget.userModel);
  }

  Widget buildSubmitButton(LoginState state) {
    return Container(
      height: 7.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
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
                      .translate("Login.Login")
                      .toUpperCase(),
                  style: GoogleFonts.roboto(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _loginBloc.add(LoginSubmitted());
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
        body: BlocListener<LoginBloc, LoginState>(
          bloc: _loginBloc,
          listener: (BuildContext context, LoginState state) {
            final submitStatus = state.submissionState;
            if (submitStatus is SubmissionFailed) {
              showSnackBar(context, submitStatus.exception.toString());
            } else if (submitStatus is SubmissionSuccess) {
              Navigator.of(context).pop();
              context.read<AuthenticationBloc>().add(LoggedIn());
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            bloc: _loginBloc,
            builder: (BuildContext context, LoginState state) {
              return Container(
                height: 100.h,
                width: 100.w,
                padding: EdgeInsets.symmetric(
                  vertical: 2.h,
                  horizontal: 4.w,
                ),
                color: Theme.of(context).colorScheme.background,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 5.h,
                        width: 2.5.h,
                        child: Center(
                          child: MaterialButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            child: SvgPicture.asset(
                              "assets/svg/back.svg",
                              semanticsLabel: 'Acme Logo',
                              height: 2.5.h,
                              width: 2.5.h,
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
                            color: Theme.of(context).colorScheme.onPrimary,
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
                          context,
                          controller: _usernameController,
                          hintText: "Username",
                          obscure: false,
                          validator: (value) =>
                              state.isValidUsername ? null : "Invalid Username",
                          onChanged: (value) =>
                              _loginBloc.add(LoginUsernameChanged(value)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 2.h,
                        ),
                        child: inputField(
                          context,
                          controller: _passwordController,
                          hintText: "Password",
                          obscure: true,
                          validator: (value) =>
                              state.isValidPassword ? null : "Invalid Password",
                          onChanged: (value) =>
                              _loginBloc.add(LoginPasswordChanged(value)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 3.h,
                        ),
                        child: buildSubmitButton(state),
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
