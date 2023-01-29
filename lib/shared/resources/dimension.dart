import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double header1FontSize = 24.sp;

//h2
double header2FontSize = 21..sp;

//h3
double header3FontSize = 18..sp;

//screenpadding
double screenpadding = 20..sp;

//body text
double textFontSize = 16..sp;

//small screenpadding vertical
double smallVerticalPadding = 10..sp;

//small screenpadding horizontal
double smallHorizontalPadding = 10..sp;

//horizontal screenpadding
double horizontalPadding = 20..sp;

// vertical screenpadding big screen
double verticalPadding = 20..sp;

//button heights
double buttonHeight = 50..sp;

//button border radius
double buttonBorderRadius = 50..sp;

//text field border radius
double textFieldBorderRadius = 50..sp;

class VerticalSpacing extends StatelessWidget {
  final double _height;
  const VerticalSpacing(this._height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height..sp,
    );
  }
}

class HorizontalSpacing extends StatelessWidget {
  final double _width;

  const HorizontalSpacing(this._width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width..w,
    );
  }
}
