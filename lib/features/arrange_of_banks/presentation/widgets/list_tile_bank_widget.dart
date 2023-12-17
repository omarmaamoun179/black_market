import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileBankWidget extends StatelessWidget {
  const ListTileBankWidget({
    super.key,
    required this.banksModel,
    // this.coinsModel,
  });

  final BanksModel banksModel;
  // final BankPrice? coinsModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(
        Icons.drag_handle,
        color: const Color(0xffF2C94C),
        size: 24.sp,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.h),
      key: ValueKey('${banksModel.hashCode}'),
      title: Column(
        children: [
          Text(
            banksModel.name!,
            style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xfffffffff),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),

          // CoulmnText(
          //   text: '${coinsModel?.buyPrice}',
          //   text2: '${coinsModel?.sellPrice}',
          // ),
        ],
      ),
      leading: CircleAvatar(
        radius: 20.r,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage('${Constant.storage}${banksModel.icon}'),
      ),
      //
      // Image.network(
      //   '${Constant.storage}${banksModel.icon}',
      //   width: 40.w,
      //   height: 40.h,
      // )
    );
  }
}
