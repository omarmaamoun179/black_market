import 'package:black_market/config/router/routes.dart';
import 'package:black_market/features/home/data/repositories/home_repo_imp.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/login/data/repositories/login_impl.dart';
import 'package:black_market/features/login/presentation/cubit/login_cubit.dart';
import 'package:device_preview/device_preview.dart';
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
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
              create: (context) => HomeCubit(
                    HomeRepoImp(),
                  )
                    ..getBanksData()
                    ..getHomeData()
                    ..getGoldData()
                    ..getCompniesData()
                    ..getIngotsData()
                    ..getChartData(19)),
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(
              LoginRepoImpl(),
            ),
          ),
        ],
        child: MaterialApp(
          useInheritedMediaQuery: true,
          theme: ThemeData(
            fontFamily: GoogleFonts.almarai().fontFamily,
            scaffoldBackgroundColor: const Color(0xff0D0D0D),
          ),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => AppRoutes.ongenerate(settings),
          initialRoute: Routes.home,
        ),
      ),
    );
  }
}
