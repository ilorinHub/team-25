import 'package:flutter/material.dart';
import 'package:machineglow/core/viewmodels/dashboard/upload_viewmodel.dart';
import 'package:machineglow/core/viewmodels/view_models.dart';
import 'package:machineglow/screens/dashboard/ui/dasboard.dart';
import 'package:machineglow/shared/resources/resources.dart';
import 'package:machineglow/shared/widgets/app_alert.dart';
import 'package:machineglow/shared/widgets/glow_button.dart';
import 'package:provider/provider.dart';

class CompleteUploadScreen extends StatefulWidget {
  const CompleteUploadScreen({super.key});

  @override
  State<CompleteUploadScreen> createState() => _CompleteUploadScreenState();
}

class _CompleteUploadScreenState extends State<CompleteUploadScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final glowTheme = Provider.of<GlowThemeViewModel>(context);
    return Consumer<UploadScreenViewmodel>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: screenpadding, vertical: screenpadding),
            child: Column(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(buttonBorderRadius),
                child: Image.file(
                  value.buidlingPhoto!,
                  height: size.height * 0.4,
                  width: size.width * 0.8,
                  fit: BoxFit.cover,
                ),
              ),
              VerticalSpacing(smallVerticalPadding),
              Text(
                'N27398 W29830',
                style:
                    glowTheme.textTheme().displayMedium?.copyWith(fontSize: 14),
              ),
              DetailsWidget(
                  glowTheme: glowTheme, title: 'Zone:', value: 'Zone A'),
              DetailsWidget(
                  glowTheme: glowTheme, title: 'LGA:', value: 'Ilorin West'),
              DetailsWidget(
                  glowTheme: glowTheme, title: 'Street:', value: 'Sanrab'),
              DetailsWidget(
                  glowTheme: glowTheme, title: 'House Number:', value: '7'),
              DetailsWidget(
                  glowTheme: glowTheme,
                  title: 'House Address:',
                  value: 'Tanke, Ilorin'),
              DetailsWidget(
                  glowTheme: glowTheme,
                  title: 'Type of building:',
                  value: 'Bungalow'),
              DetailsWidget(
                  glowTheme: glowTheme, title: 'No of rooms:', value: '1'),
              DetailsWidget(
                  glowTheme: glowTheme,
                  title: 'Tax payable of rooms Address:',
                  value: '1500 NGN'),
              GlowButton(
                  onTap: () async {
                    value.submitData().then((value) =>
                        AppAlert.showSuccessMessage(
                            context: context,
                            message: 'Data Uploaded succesfully'));
                    value.buidlingPhoto = null;
                    Navigator.pushNamed(context, DashboardScreen.routeName);
                  },
                  text: 'Save Data',
                  loading: value.isLoading)
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: glowTheme.textTheme().displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
          ),
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
