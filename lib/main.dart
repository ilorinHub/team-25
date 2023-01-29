import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:machineglow/core/api/utils/utils.dart';
import 'package:machineglow/core/containers/app_injection_container.dart';
import 'package:machineglow/core/viewmodels/view_models.dart';
import 'package:machineglow/screens/auth/ui/login_screen.dart';
import 'package:machineglow/shared/resources/resources.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.initDependencies();
  runApp(MultiProvider(providers: [
    ...glowProviders,
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(400, 850),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
              theme: sl<GlowThemeViewModel>().theme(),
              home: const GlowSplashScreen(),
              onGenerateRoute: (settings) {
                return AppRoute.routes(settings, context);
              });
        });
  }
}

class GlowSplashScreen extends StatefulWidget {
  const GlowSplashScreen({super.key});

  @override
  State<GlowSplashScreen> createState() => _GlowSplashScreenState();
}

class _GlowSplashScreenState extends State<GlowSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        SignInScreen.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(logoPNG),
            ),
          ],
        ),
      ),
    );
  }
}
