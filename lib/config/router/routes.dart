import 'package:black_market/features/arrange_of_banks/presentation/pages/arrange_banks_screen.dart';
import 'package:black_market/features/arrange_of_coins/presentation/pages/arrange_of_coins.dart';
import 'package:black_market/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:black_market/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:black_market/features/auth/presentation/pages/finish_screen.dart';
import 'package:black_market/features/auth/presentation/pages/forget_password.dart';
import 'package:black_market/features/auth/presentation/pages/otp_screen.dart';
import 'package:black_market/features/bank_details/presentation/pages/bank_details.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/presentation/pages/home_layout.dart';
import 'package:black_market/features/languages/presentation/pages/lanugage_screen.dart';
import 'package:black_market/features/login/data/repositories/login_impl.dart';
import 'package:black_market/features/login/presentation/cubit/login_cubit.dart';
import 'package:black_market/features/login/presentation/pages/login_page.dart';
import 'package:black_market/features/notification/data/models/articels_details/datum.dart';
import 'package:black_market/features/notification/presentation/pages/articels_details_screen.dart';
import 'package:black_market/features/notification/presentation/pages/notifaction_screen.dart';
import 'package:black_market/features/register/data/repositories/register_repo_impl.dart';
import 'package:black_market/features/register/presentation/cubit/register_cubit.dart';
import 'package:black_market/features/register/presentation/pages/register.dart';
import 'package:black_market/features/saving/presentation/pages/saving.dart';
import 'package:black_market/features/setting/presentation/pages/setting.dart';
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
  static const String saving = 'saving';
  static const String setting = 'setting';
  static const String arrangeBanks = 'arrangeBanks';
  static const String arrangeCoins = 'arrangeCoins';
  static const String language = 'language';
  static const String notification = 'notification';
  static const String articlesDetails = 'articlesDetails';
}

class AppRoutes {
  static Route? ongenerate(RouteSettings settings) {
    switch (settings.name) {
      case (Routes.splash):
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case (Routes.login):
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(LoginRepoImpl()),
                  child: const LogingScreen(),
                ));
      case (Routes.register):
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RegisterCubit(
                    RigsterRepoImpl(),
                  ),
                  child: RegisterScreen(),
                ));
      case (Routes.foregetPassword):
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(
                    AuthRepoImpl(),
                  ),
                  child: const ForgetPassword(),
                ));
      case (Routes.otp):
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(
                    AuthRepoImpl(),
                  ),
                  child: OtpScreen(
                    email: settings.arguments as String,
                  ),
                ));
      // case (Routes.confirmPass):
      //   return MaterialPageRoute(builder: (_) => ConfirmPassword());
      case (Routes.bankDetails):
        return MaterialPageRoute(
            builder: (_) => BankDetails(
                  banksModel: settings.arguments as BanksModel,
                ));

      case (Routes.finish):
        return MaterialPageRoute(builder: (_) => const FinishScreen());
      case (Routes.home):
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case (Routes.saving):
        return MaterialPageRoute(
            builder: (_) => SavingScreen(
                  title: settings.arguments as String,
                ));
      case (Routes.setting):
        return MaterialPageRoute(
          builder: (_) => SettingScreen(
            titile: settings.arguments as String,
          ),
        );
      case (Routes.arrangeBanks):
        return MaterialPageRoute(
            builder: (_) => ArrangeBanks(
                  title: settings.arguments as String,
                ));
      case (Routes.arrangeCoins):
        return MaterialPageRoute(
            builder: (_) => ArrangeCoins(
                  title: settings.arguments as String,
                ));
      case (Routes.language):
        return MaterialPageRoute(
            builder: (_) => LangugaeScreen(
                  title: settings.arguments as String,
                ));
      case (Routes.notification):
        return MaterialPageRoute(
          builder: (_) => const NotifactionScreen(),
        );
        case (Routes.articlesDetails):
        return MaterialPageRoute(
          builder: (_) => ArticelsDetailsScreen(
            datumArticlesDetails: settings.arguments as DatumArticlesDetails,
          ),
        );
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
