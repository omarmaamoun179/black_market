import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileCoinsWidget extends StatelessWidget {
  const ListTileCoinsWidget({
    super.key,
    required this.index,
    required this.coinsModel,
  });

  final int index;
  final CoinsModel coinsModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(
        Icons.drag_handle,
        color: const Color(0xffF2C94C),
        size: 24.sp,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.h),
      key: ValueKey('${coinsModel.hashCode}_$index'),
      title: Text(
        coinsModel.name!,
        style: TextStyle(
          fontSize: 16.sp,
          color: const Color(0xfffffffff),
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: CircleAvatar(
        radius: 20.r,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage('${Constant.storage}${coinsModel.icon}'),
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
