import 'package:black_market/features/auth/presentation/pages/confirm_password.dart';
import 'package:black_market/features/auth/presentation/pages/finish_screen.dart';
import 'package:black_market/features/auth/presentation/pages/forget_password.dart';
import 'package:black_market/features/auth/presentation/pages/login_page.dart';
import 'package:black_market/features/auth/presentation/pages/otp_screen.dart';
import 'package:black_market/features/auth/presentation/pages/register.dart';
import 'package:black_market/features/bank_details/presentation/pages/bank_details.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/pages/home_layout.dart';
import 'package:black_market/features/splash/presentation/pages/splash._screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = 'register';
  static const String foregetPassword = 'foregetPassword';
  static const String otp = 'otp';
  static const String confirmPass = 'confirmPass';
  static const String home = 'home';
  static const String profile = 'profile';
  static const String coins = 'coins';
  static const String golds = 'golds';
  static const String favorites = 'favorites';
  static const String bankDetails = 'bankDetails';


  static const String finish = 'finish';
}

class AppRoutes {
  static Route? ongenerate(RouteSettings settings) {
    switch (settings.name) {
      case (Routes.splash):
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case (Routes.login):
        return MaterialPageRoute(builder: (_) => LogingScreen());
      case (Routes.register):
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case (Routes.foregetPassword):
        return MaterialPageRoute(builder: (_) => ForgetPassword());
      case (Routes.otp):
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case (Routes.confirmPass):
        return MaterialPageRoute(builder: (_) => ConfirmPassword());
      case (Routes.bankDetails):
        return MaterialPageRoute(builder: (_) => const BankDetails());
     
      case (Routes.finish):
        return MaterialPageRoute(builder: (_) => const FinishScreen());
      case (Routes.home):
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomeCubit(),
                  child: const HomeScreen(),
                ));
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
