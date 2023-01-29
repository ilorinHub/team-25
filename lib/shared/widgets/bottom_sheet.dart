import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machineglow/shared/resources/dimension.dart';

Future<void> showGlowMachineBottomSheetModal({
  required BuildContext context,
  required Widget child,
  required Size size,
  Color? barrierColor,
  Color? backgroundColor,
  double? heightOfSheet,
}) async {
  showModalBottomSheet(
    isDismissible: false,
    useRootNavigator: false,
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height,
    ),
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: heightOfSheet ?? MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                VerticalSpacing(smallVerticalPadding),
                Container(
                  height: 4..sp,
                  width: 64..sp,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius:
                        BorderRadius.circular(smallHorizontalPadding..sp),
                  ),
                ),
                VerticalSpacing(screenpadding),
                Expanded(
                    child: SingleChildScrollView(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenpadding / 2),
                        child: child)),
              ],
            ),
          ),
        ),
      ),
    ),
    isScrollControlled: true,
    barrierColor: barrierColor ?? Colors.transparent,
    enableDrag: true,
  );
}
