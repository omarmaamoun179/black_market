import 'package:black_market/core/api/api_manager.dart';
import 'package:black_market/myapp.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  DioHelper.initDio();
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => EasyLocalization(
        
          startLocale: const Locale(
            'ar',
          ),
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ar', 'EG'),
          ],
          path: 'assets/translation',
          child: const MyApp())));
}
