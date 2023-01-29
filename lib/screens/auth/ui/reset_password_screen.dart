import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machineglow/core/viewmodels/view_models.dart';
import 'package:machineglow/shared/resources/resources.dart';
import 'package:machineglow/shared/widgets/header_texts.dart';
import 'package:machineglow/shared/widgets/glow_button.dart';
import 'package:machineglow/shared/widgets/text_field.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = "/reset_pass";
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pass1 = TextEditingController();
  final TextEditingController _pass2 = TextEditingController();
  final TextEditingController _otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final glowthemeData = Provider.of<GlowThemeViewModel>(context);
    return Consumer<AuthViewModel>(builder: (context, viewmodel, child) {
      return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              VerticalSpacing(50.h),
              const GlowThemeHeaderText(
                richText: false,
                title: 'Confirm otp',
                description:
                    'Enter the email sent to your email and new password',
              ),
              VerticalSpacing(50.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldWidget(
                      hintText: "Enter OTP",
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      controller: _otp,
                      textInputType: TextInputType.number,
                      validator: (String? val) =>
                          UtilsHelpers.validateRequiredFields(val!.trim(),
                              label: 'Otp'),
                    ),
                    VerticalSpacing(20.h),
                    TextFieldWidget(
                      hintText: "Enter New Password",
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      controller: _pass1,
                      textInputType: TextInputType.text,
                      validator: (String? val) =>
                          UtilsHelpers.validatePassword1(
                        val!.trim(),
                      ),
                    ),
                    VerticalSpacing(20.h),
                    TextFieldWidget(
                      hintText: "Re-Enter Password",
                      textInputAction: TextInputAction.done,
                      obscureText: false,
                      controller: _pass2,
                      textInputType: TextInputType.text,
                      validator: (String? val) =>
                          UtilsHelpers.validatePassword2(
                              val!.trim(), _pass1.text),
                    ),
                  ],
                ),
              ),
              VerticalSpacing(
                buttonHeight,
              ),
              SizedBox(
                width: double.infinity,
                child: GlowButton(
                  loading: false,
                  text: 'Login',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      viewmodel
                          .resetPassword(
                            _otp.text,
                            _pass1.text.trim(),
                          )
                          .then((value) {});
                    }
                  },
                ),
              ),
              VerticalSpacing(
                (smallVerticalPadding),
              ),
            ],
          ),
        ),
      );
    });
  }
}
