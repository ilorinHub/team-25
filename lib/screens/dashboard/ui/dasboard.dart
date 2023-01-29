import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:machineglow/core/viewmodels/dashboard/upload_viewmodel.dart';
import 'package:machineglow/core/viewmodels/theme/theme_view_model.dart';
import 'package:machineglow/screens/dashboard/ui/data_room.dart';
import 'package:machineglow/screens/dashboard/ui/description.dart';
import 'package:machineglow/shared/resources/resources.dart';
import 'package:machineglow/shared/widgets/glow_button.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = "/dash";
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget _widget = const SizedBox.shrink();
  void showTheTwoButtons(UploadScreenViewmodel value) {
    _widget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            value.buidlingPhoto = null;
          },
          child: const Align(
            child: DecoratedBox(
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(Icons.close)),
          ),
        ),
        const VerticalSpacing(20),
        GlowButton(
          loading: false,
          onTap: () {
            value.pickImage();
          },
          text: 'Change Picture',
          btnColor: kprimaryColorLight,
        ),
        GlowButton(
          loading: false,
          onTap: () {
            Navigator.pushNamed(context, DescriptionScreen.routeName);
          },
          text: 'Proceed',
          btnColor: kprimaryColor,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final glowTheme = Provider.of<GlowThemeViewModel>(context);
    return Consumer<UploadScreenViewmodel>(builder: (context, value, child) {
      return Scaffold(
        body: Stack(
          children: [
            if (value.buidlingPhoto != null)
              Image.file(
                value.buidlingPhoto!,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenpadding, vertical: screenpadding),
              child: Column(
                children: [
                  VerticalSpacing(verticalPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: kprimaryColor)),
                          child: SvgPicture.asset(personSVG)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const DataRoom()));
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            decoration: BoxDecoration(
                                color: kprimaryColor,
                                borderRadius: BorderRadius.circular(30..h),
                                border: Border.all(color: kprimaryColor)),
                            child: Text(
                              'Data Room',
                              style: glowTheme.textTheme().displayMedium,
                            )),
                      )
                    ],
                  ),
                  Expanded(child: _widget),
                  if (value.buidlingPhoto == null) const Spacer(),
                  if (value.buidlingPhoto == null)
                    Padding(
                      padding: EdgeInsets.only(bottom: 16..sp),
                      child: InkWell(
                          splashColor: kprimaryColor,
                          borderRadius: BorderRadius.circular(30..sp),
                          onTap: () {
                            value.pickImage().then((val) {
                              if (val) {
                                showTheTwoButtons(value);
                                setState(() {});
                              }
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: kprimaryColor)),
                              child: Icon(
                                Icons.camera_alt,
                                size: 60..sp,
                                color: kprimaryColor,
                              ))),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
