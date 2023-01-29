import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machineglow/core/viewmodels/view_models.dart';
import 'package:machineglow/shared/resources/resources.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    this.label,
    required this.obscureText,
    required this.textInputType,
    required this.validator,
    required this.controller,
    required this.textInputAction,
    this.hasSuffixIcon = false,
    this.inputFormatters,
    this.textAlign,
    this.onChanged,
    this.suffixImage,
    this.hasBgsuffixIcon = true,
    this.suffixIcon,
    this.initialValue,
    this.onTap,
    this.borderRadius,
    this.isEnabled,
  }) : super(key: key);
  final Widget? suffixIcon;
  final String hintText;
  final String? label, suffixImage, initialValue;
  final bool obscureText;
  final bool? hasSuffixIcon, hasBgsuffixIcon, isEnabled;
  final TextInputType textInputType;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final glowthemeData = Provider.of<GlowThemeViewModel>(context);

    return TextFormField(
      enabled: isEnabled,
      style: glowthemeData.textTheme().displaySmall,
      inputFormatters: inputFormatters,
      textAlign: textAlign ?? TextAlign.start,
      validator: validator,
      initialValue: initialValue,
      keyboardType: textInputType,
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged,
      onTap: onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: (horizontalPadding),
          vertical: (smallVerticalPadding),
        ),
        filled: true,
        fillColor: kprimaryColorLight,
        hintText: hintText,
        hintStyle: glowthemeData.textTheme().bodyMedium,
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(borderRadius ?? (textFieldBorderRadius)),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? (textFieldBorderRadius)),
          borderSide: BorderSide(
            color: kprimaryColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? (textFieldBorderRadius)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? (textFieldBorderRadius)),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? (textFieldBorderRadius)),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.4),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? (textFieldBorderRadius)),
          borderSide: BorderSide(
            color: Colors.red.withOpacity(0.4),
          ),
        ),
        errorStyle: GoogleFonts.poppins(
          fontSize: (textFontSize * 0.7),
        ),
      ),
    );
  }
}

// class MultiLineTextFieldWidget extends StatelessWidget {
//   const MultiLineTextFieldWidget({
//     Key? key,
//     required this.hintText,
//     required this.textInputType,
//     required this.controller,
//     required this.textInputAction,
//   }) : super(key: key);
//   final String hintText;
//   final TextInputType textInputType;
//   final TextEditingController? controller;
//   final TextInputAction? textInputAction;

//   @override
//   Widget build(BuildContext context) {
//     final glowthemeData = Provider.of<GlowThemeViewModel>(context);
//     return TextFormField(
//       style: glowthemeData.textTheme().bodyText1,
//       keyboardType: textInputType,
//       controller: controller,
//       textInputAction: textInputAction,
//       maxLines: 5,
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.symmetric(
//           horizontal: (horizontalPadding),
//           vertical: (smallVerticalPadding),
//         ),
//         filled: true,
//         fillColor: kprimaryColorLight,
//         hintText: hintText,
//         hintStyle: glowthemeData.textTheme().bodyText2,
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular((textFieldBorderRadius)),
//             borderSide: BorderSide.none),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular((textFieldBorderRadius)),
//           borderSide: BorderSide(
//             color: kprimaryColor,
//           ),
//         ),
//         disabledBorder: InputBorder.none,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular((textFieldBorderRadius)),
//           borderSide: BorderSide.none,
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular((textFieldBorderRadius)),
//           borderSide: BorderSide(
//             color: Colors.red.withOpacity(0.4),
//           ),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular((textFieldBorderRadius) / 2),
//           borderSide: BorderSide(
//             color: Colors.red.withOpacity(0.4),
//           ),
//         ),
//         errorStyle: GoogleFonts.poppins(
//           fontSize: (textFontSize * 0.7),
//         ),
//       ),
//     );
//   }
// }
