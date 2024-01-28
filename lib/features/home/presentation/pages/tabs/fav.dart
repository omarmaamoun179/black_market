// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:black_market/core/local/save_fav.dart';
import 'package:black_market/core/utils/constant.dart';
import 'package:black_market/features/home/data/models/banks_model/banks_model.dart';
import 'package:black_market/features/home/data/models/coins_model/bank_price.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/coins_widget/column_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late List<BanksModel> favBank;
  late List<BankPrice> favBankPrice;
  late List<CoinsModel> favCoinId;
  @override
  void initState() {
    super.initState();
    updateFavorites();
  }

  void updateFavorites() {
    favBank = SaveBankFavorite.getFavorites();
    favBankPrice = SaveBankPriceFavorite.getFavorites();
    favCoinId = SaveCoinIdFavorite.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        cubit.favBank = [];

        for (var e in favBank) {
          for (var i in favBankPrice) {
            for (var j in favCoinId) {
              if (i.bankId == e.id && i.currencyId == j.id) {
                cubit.favBank.add(BankFavItemWidget(
                  e: e,
                  i: i,
                  j: j,
                  onDelete: (e, i, j) {
                    cubit.deleteBank(e, i, j);
                    setState(() {
                      favBank = SaveBankFavorite.getFavorites();
                      favBankPrice = SaveBankPriceFavorite.getFavorites();
                      favCoinId = SaveCoinIdFavorite.getFavorites();
                    });
                  },
                ));

                // Break out of the inner loop once the condition is met
              }
            }
          }
        }

        return SafeArea(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: cubit.favBank.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .75,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemBuilder: (context, index) {
              return cubit.favBank[index];
            },
          ),
        );
      },
    );
  }
}

class BankFavItemWidget extends StatefulWidget {
  const BankFavItemWidget({
    super.key,
    required this.e,
    required this.i,
    required this.j,
    required this.onDelete,
  });

  final BanksModel? e;
  final BankPrice? i;
  final CoinsModel? j;
  final Function(
    BanksModel,
    BankPrice,
    CoinsModel,
  ) onDelete;
  @override
  State<BankFavItemWidget> createState() => _BankFavItemWidgetState();
}

class _BankFavItemWidgetState extends State<BankFavItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: 156.w,
      height: 156.h,
      decoration: BoxDecoration(
        color: const Color(0xff2A2A2A),
        borderRadius: BorderRadius.circular(7.7.r),
        border: Border.all(
          width: .5.w,
          color: const Color(0xff4F4F4F),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 14.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 25.5.w,
                height: 25.5.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: .78.w,
                    color: const Color(0xff4F4F4F),
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    print('clicked22');
                    widget.e != null
                        ? widget.onDelete(widget.e!, widget.i!, widget.j!)
                        : null;
                  },
                  icon: Icon(
                    Icons.favorite,
                    size: 12.sp,
                    color: const Color(0xffF1F0FA),
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[800],
                maxRadius: 25.r,
                child: CachedNetworkImage(
                  imageUrl: '${Constant.storage}${widget.e?.icon ?? ' '}',
                  // height: 46.h,
                  // width: 46.w,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Container(
                width: 25.5.w,
                height: 25.5.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: .78.w,
                    color: const Color(0xff4F4F4F),
                  ),
                ),
                child: Icon(
                  Icons.share,
                  size: 12.sp,
                  color: const Color(0xffF1F0FA),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: '${Constant.storage}${widget.j?.icon ?? ' '}',
                height: 20.h,
                width: 20.w,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                HomeCubit.get(context).getCurrencyCode(widget.j?.name ?? ''),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffFFFFFF),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.e?.name ?? '',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xffFFFFFF),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CoulmnText(
                  text: 'شراء',
                  text2: '${widget.i?.buyPrice ?? '0'}',
                  style2: TextStyle(
                    color: const Color(0xffffffff),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                VerticalDivider(
                  color: const Color(0xff4F4F4F),
                  indent: 18.h,
                  width: 18.w,
                ),
                CoulmnText(
                  color1: const Color(0xffffffff),
                  text: 'بيع',
                  text2: '${widget.i?.sellPrice ?? '0'}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
