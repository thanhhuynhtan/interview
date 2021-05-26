import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview/app/bloc/AuthenticationBloc.dart';
import 'package:interview/app/bloc/AuthenticateEvent.dart';
import 'package:interview/Model/SubmissionState.dart';
import 'package:interview/Model/UserModel.dart';
import 'package:interview/Utils/SnackBar.dart';
import 'package:interview/Utils/localization.dart';
import 'package:interview/Utils/InputField.dart';
import 'package:interview/register/bloc/RegisterBloc.dart';
import 'package:interview/register/bloc/RegisterEvent.dart';
import 'package:interview/register/bloc/RegisterState.dart';
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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();
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
                      .translate('Login.Register')
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
        body: BlocConsumer<RegisterBloc, RegisterState>(
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
          builder: (BuildContext context, RegisterState state) {
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
                            'assets/svg/back.svg',
                            semanticsLabel: 'Acme Logo',
                            height: 2.5.h,
                            width: 2.5.h,
                            color: Theme.of(context).colorScheme.onPrimary,
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
                        hintText: 'Username',
                        obscure: false,
                        validator: (value) =>
                            state.isValidUsername ? null : 'Invalid Username',
                        onChanged: (value) =>
                            _registerBloc.add(RegisterUsernameChanged(value)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 2.h,
                      ),
                      child: inputField(
                        context,
                        controller: _passwordController,
                        hintText: 'Password',
                        obscure: true,
                        validator: (value) =>
                            state.isValidPassword ? null : 'Invalid Password',
                        onChanged: (value) =>
                            _registerBloc.add(RegisterPasswordChanged(value)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 2.h,
                      ),
                      child: inputField(
                        context,
                        controller: _repasswordController,
                        hintText: 'Re-input Password',
                        obscure: true,
                        validator: (value) =>
                            state.isValidRePassword ? null : 'Incorrect',
                        onChanged: (value) =>
                            _registerBloc.add(RegisterRePasswordChanged(value)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 3.h,
                      ),
                      child: buildSubmitButton(state),
                    ),
                    Html(
                      data:
                          AppLocalization.of(context)!.translate('Login.Term'),
                      style: {
                        'body': Style(
                          fontSize: FontSize(18.0),
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontFamily: 'roboto',
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
    );
  }
}
