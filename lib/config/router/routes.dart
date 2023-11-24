import 'package:black_market/features/auth/presentation/pages/forget_password.dart';
import 'package:black_market/features/auth/presentation/pages/login_page.dart';
import 'package:black_market/features/auth/presentation/pages/otp_screen.dart';
import 'package:black_market/features/auth/presentation/pages/register.dart';
import 'package:black_market/features/splash/presentation/pages/splash._screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = 'register';
  static const String foregetPassword = 'foregetPassword';
  static const String otp = 'otp';
  static const String home = 'home';
}

class AppRoutes {
  static Route? ongenerate(RouteSettings settings) {
    switch (settings.name) {
      case (Routes.splash):
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case (Routes.login):
        return MaterialPageRoute(builder: (_) => LogingScreen());
      case (Routes.register):
        return MaterialPageRoute(builder: (_) =>  RegisterScreen());
          case (Routes.foregetPassword):
        return MaterialPageRoute(builder: (_) => ForgetPassword());
          case (Routes.otp):
        return MaterialPageRoute(builder: (_) => OtpScreen());
      default:
        MaterialPageRoute(builder: (_) => unDefindeRoute());
    }
    return null;
  }

  static Widget unDefindeRoute() => const Scaffold(
        body: Center(
          child: Text("Page not found"),
        ),
      );
}
