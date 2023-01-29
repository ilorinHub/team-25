import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machineglow/core/viewmodels/view_models.dart';
import 'package:machineglow/shared/resources/resources.dart';
import 'package:machineglow/shared/widgets/header_texts.dart';
import 'package:machineglow/shared/widgets/glow_button.dart';
import 'package:machineglow/shared/widgets/text_field.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = "/forgot";
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final glowthemeData = Provider.of<GlowThemeViewModel>(context);
    return Consumer<AuthViewModel>(builder: (context, viewmodel, child) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(50.h),
              const GlowThemeHeaderText(
                richText: false,
                title: 'Reset password',
                description: 'Enter your email to reset your password',
              ),
              VerticalSpacing(50.h),
              Form(
                key: _formKey,
                child: TextFieldWidget(
                  hintText: "Email Address",
                  textInputAction: TextInputAction.done,
                  obscureText: false,
                  controller: _email,
                  textInputType: TextInputType.emailAddress,
                  validator: (String? val) => UtilsHelpers.validateEmail(
                    val!.trim(),
                  ),
                ),
              ),
              VerticalSpacing(
                buttonHeight,
              ),
              SizedBox(
                width: double.infinity,
                child: GlowButton(
                  loading: false,
                  text: 'Proceed',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      viewmodel
                          .requestResetPassword(
                            _email.text.trim(),
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
