import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machineglow/core/models/auth/requests/requests.dart';
import 'package:machineglow/core/viewmodels/view_models.dart';
import 'package:machineglow/screens/auth/ui/forgot_password_screen.dart';
import 'package:machineglow/screens/dashboard/ui/dasboard.dart';
import 'package:machineglow/shared/resources/resources.dart';
import 'package:machineglow/shared/widgets/header_texts.dart';
import 'package:machineglow/shared/widgets/glow_button.dart';
import 'package:machineglow/shared/widgets/text_field.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "/login";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final glowthemeData = Provider.of<GlowThemeViewModel>(context);
    return Consumer<AuthViewModel>(builder: (context, viewmodel, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GlowThemeHeaderText(
                  title: 'Welcome back,',
                  description: 'Login to your account',
                ),
                VerticalSpacing(50.h),
                TextFieldWidget(
                  hintText: "Email Address",
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  controller: _email,
                  textInputType: TextInputType.emailAddress,
                  validator: (String? val) => UtilsHelpers.validateEmail(
                    val!.trim(),
                  ),
                ),
                VerticalSpacing((screenpadding)),
                TextFieldWidget(
                  hintText: "Password",
                  textInputAction: TextInputAction.done,
                  obscureText: !viewmodel.show,
                  controller: _pass,
                  textInputType: TextInputType.text,
                  validator: (String? val) => UtilsHelpers.validatePassword1(
                    val!.trim(),
                  ),
                  hasSuffixIcon: true,
                  suffixIcon: GestureDetector(
                    onTap: () => viewmodel.togglePasswordVisibility(),
                    child: Icon(
                      viewmodel.show ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                VerticalSpacing((verticalPadding)),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      ForgotPasswordScreen.routeName,
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: glowthemeData.textTheme().bodyText2?.copyWith(
                          color: ktextColor,
                          fontSize: (textFontSize),
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                VerticalSpacing(
                  buttonHeight,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GlowButton(
                    loading: viewmodel.loading,
                    text: 'Login',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        log('${_email.text}, ${_pass.text}');
                        _formKey.currentState!.save();
                        viewmodel
                            .loginUser(LoginRequest(
                                email: _email.text.trim(),
                                password: _pass.text.trim()))
                            .then((value) {
                          if (value) {
                            log('Login success');
                            Navigator.pushReplacementNamed(
                                context, DashboardScreen.routeName);
                          } else {
                            log('Login failed');
                            log(viewmodel.message);
                          }
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
