import 'package:black_market/features/bank_details/presentation/widgets/statics_of_bank.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/widgets/column_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BankDetailsAppBar extends StatelessWidget {
  BankDetailsAppBar({
    super.key,
    required this.banksModel,
  });
  BanksModel banksModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xff1A1A1A),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 230.h),
                decoration: BoxDecoration(
                  color: const Color(0xff0E0E0E).withOpacity(.4),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 26.h,
          ),
          Text(
            'Black<Market',
            style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w800,
                color: const Color(0xffFEDC00)),
          ),
          Positioned(
            bottom: 70.h,
            child: Text(
              ' بكام في السوق السوداء ؟',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffFFF4B0)),
            ),
          ),
          Positioned(
            top: 230.h,
            child: StatictsOfBank(
              banksModel: banksModel,
              coulmnText1: CoulmnText(
                text: 'البنك',
                text2:
                    '${HomeCubit.get(context).selectedCoin?.livePrices?[0].price ?? ''}',
                color2: const Color(0xff2a2a2a),
              ),
              coulmnText2: CoulmnText(
                text: 'أخر تحديث',
                text2:
                    'منذ ${HomeCubit.get(context).selectedCoin?.updatedAt?.minute ?? ''} دقيقة',
                color2: const Color(0xff2a2a2a),
              ),
              coulmnText3: CoulmnText(
                text: 'السوق السوداء',
                text2:
                    '${HomeCubit.get(context).selectedCoin?.blackMarketPrices?[0].sellPrice ?? ''}',
                color2: const Color(0xffBFA500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
