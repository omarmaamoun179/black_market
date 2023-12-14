import 'package:black_market/config/router/routes.dart';
import 'package:black_market/features/home/data/repositories/home_repo_imp.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => BlocProvider(
        create: (context) => HomeCubit(
          HomeRepoImp(),
        )
          ..getBanksData()
          ..getHomeData()
          ..getGoldData()
          ..getCompniesData()
          ..getIngotsData(),
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: GoogleFonts.almarai().fontFamily,
            scaffoldBackgroundColor: const Color(0xff0D0D0D),
          ),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => AppRoutes.ongenerate(settings),
          initialRoute: Routes.home,
        ),
      ),
    );
  }
}
