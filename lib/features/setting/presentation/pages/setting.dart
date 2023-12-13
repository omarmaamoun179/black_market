import 'package:black_market/config/router/routes.dart';
import 'package:black_market/core/widget/custom_app_bar.dart';
import 'package:black_market/features/home/presentation/pages/tabs/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({
    super.key,
    this.titile,
  });
  final String? titile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            CustomAppBar(
              title: titile!,
              icon: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.arrangeBanks,
                        arguments: 'الترتيب المفضل للبنوك',
                      );
                    },
                    child: profileItemWidget(
                        icon: Icons.account_balance,
                        text: 'الترتيب المفضل للبنوك'),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.arrangeCoins,
                        arguments: 'الترتيب المفضل للعملات',
                      );
                    },
                    child: profileItemWidget(
                      icon: Icons.monetization_on_outlined,
                      text: 'الترتيب المفضل للعملات',
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.language,
                        arguments: 'اللغة',
                      );
                    },
                    child: profileItemWidget(
                      icon: Icons.language_outlined,
                      text: 'اللغة',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
