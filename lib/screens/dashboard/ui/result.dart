import 'package:flutter/material.dart';
import 'package:machineglow/core/viewmodels/dashboard/upload_viewmodel.dart';
import 'package:machineglow/core/viewmodels/view_models.dart';
import 'package:machineglow/shared/resources/resources.dart';
import 'package:machineglow/shared/widgets/app_alert.dart';
import 'package:machineglow/shared/widgets/glow_button.dart';
import 'package:provider/provider.dart';

class ShowResultScreen extends StatefulWidget {
  const ShowResultScreen({super.key});

  @override
  State<ShowResultScreen> createState() => _ShowResultScreenState();
}

class _ShowResultScreenState extends State<ShowResultScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final glowTheme = Provider.of<GlowThemeViewModel>(context);
    return Consumer<UploadScreenViewmodel>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Column(children: [
          Image.file(
            value.buidlingPhoto!,
            height: size.height * 0.4,
            width: size.width * 0.8,
            fit: BoxFit.cover,
          ),
          VerticalSpacing(smallVerticalPadding),
          Text(
            'N27398 W29830',
            style: glowTheme.textTheme().displayMedium?.copyWith(fontSize: 14),
          ),
          Column(
            children: [
              DetailsWidget(
                  glowTheme: glowTheme,
                  title: 'No of builidings:',
                  value: '100'),
              DetailsWidget(
                  glowTheme: glowTheme,
                  title: 'Types of builidings::',
                  value: 'Bugalow, Duplex,\nSupermarket'),
              DetailsWidget(
                  glowTheme: glowTheme, title: 'Tax Accrued:', value: 'N4,000'),
              GlowButton(
                  onTap: () async {
                    value.submitData().then((value) =>
                        AppAlert.showSuccessMessage(
                            context: context,
                            message: 'Data Uploaded succesfully'));
                  },
                  text: 'Export as PDF',
                  loading: value.isLoading),
              VerticalSpacing(screenpadding),
              Text(
                'Go Back',
                style:
                    glowTheme.textTheme().displayMedium?.copyWith(fontSize: 14),
              ),
              VerticalSpacing(screenpadding),
            ],
          ),
        ])),
      );
    });
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    required this.glowTheme,
    required this.title,
    required this.value,
  });

  final GlowThemeViewModel glowTheme;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: glowTheme.textTheme().displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
          ),
          HorizontalSpacing(smallHorizontalPadding),
          Text(
            value,
            style: glowTheme
                .textTheme()
                .displayMedium
                ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
