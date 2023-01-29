import 'package:flutter/material.dart';
import 'package:machineglow/core/viewmodels/view_models.dart';
import 'package:machineglow/main.dart';
import 'package:machineglow/screens/auth/ui/forgot_password_screen.dart';
import 'package:machineglow/screens/auth/ui/login_screen.dart';
import 'package:machineglow/screens/auth/ui/reset_password_screen.dart';

import 'package:machineglow/screens/dashboard/ui/dasboard.dart';
import 'package:machineglow/screens/dashboard/ui/description.dart';
import 'package:machineglow/screens/profile/ui/profile.dart';
import 'package:provider/provider.dart';

class AppRoute {
  static Route<dynamic> routes(RouteSettings settings, BuildContext context) {
    String routeName = settings.name!;
    final authProv = context.read<StateProvider>();
    if (settings.name == SignInScreen.routeName &&
        authProv.stateStatus == StateStatus.authenticated) {
      routeName = DashboardScreen.routeName;
    }

    switch (routeName) {
      case SignInScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      case ResetPasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case DashboardScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      case ProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case DescriptionScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DescriptionScreen());

      default:
        return MaterialPageRoute(builder: (_) => const GlowSplashScreen());
    }
  }
}
