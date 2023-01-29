import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machineglow/shared/resources/resources.dart';

class GlowButton extends StatelessWidget {
  const GlowButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.loading,
    this.disabled = true,
    this.btnColor,
    this.textColor,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;
  final bool loading;
  final bool? disabled;
  final Color? btnColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: (textFieldBorderRadius),
      ),
      child: InkWell(
        onTap: loading ? null : onTap,
        borderRadius: BorderRadius.circular(
          (textFieldBorderRadius) / 4,
        ),
        child: Container(
          alignment: Alignment.center,
          height: (buttonHeight),
          decoration: BoxDecoration(
            color: !loading
                ? btnColor ?? kprimaryColor
                : kprimaryColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(
              (buttonBorderRadius) / 1.2,
            ),
          ),
          child: (disabled! && loading)
              ? SizedBox(
                  height: (buttonHeight) / 2.2,
                  width: (buttonHeight) / 2.2,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: GoogleFonts.poppins(
                        color: textColor ?? textColor,
                        fontSize: textFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
