import 'package:black_market/features/home/data/models/coins_model/black_market_price.dart';
import 'package:black_market/features/home/data/models/coins_model/coins_model.dart';
import 'package:black_market/features/home/data/models/coins_model/live_price.dart';
import 'package:black_market/features/home/data/repositories/home_repo_imp.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:black_market/features/home/presentation/widgets/column_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StackWidget extends StatefulWidget {
  StackWidget({
    super.key,
    this.coinsModel,
    this.livePrice,
    this.blackMarketPrice,
  });
  CoinsModel? coinsModel;
  LivePrice? livePrice;
  BlackMarketPrice? blackMarketPrice;

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        HomeRepoImp(),
      ),
      child: Container(
        height: 92.h,
        width: 327.w,
        decoration: BoxDecoration(
          color: const Color(0xfffafafa),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.coinsModel?.name ?? 'الدولار الأمريكي',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff4F4F4F),
                  ),
                ),
                CachedNetworkImage(
                  imageUrl:
                      'http://voipsys.space/storage/${widget.coinsModel?.icon ?? ''}',
                  width: 25.5.w,
                  height: 25.5.h,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final selectedCoinsModel = await showDialog<CoinsModel>(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: DialogWidget(
                            coinsModel: HomeCubit.get(context).coinsModel!,
                          ),
                        );
                      },
                    );

                    if (selectedCoinsModel != null) {
                      setState(() {
                        widget.coinsModel = selectedCoinsModel;
                      });
                    }
                  },
                  icon: const Icon(Icons.keyboard_arrow_down_outlined,
                      color: Colors.black),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CoulmnText(
                          text: 'سعر البنك',
                          text2:
                              '${widget.coinsModel?.livePrices?[index].price ?? ''}',
                          style2: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xffBFA500),
                          ),
                        ),
                        CoulmnText(
                          text: 'أخر تحديث',
                          text2:
                              'منذ ${widget.coinsModel?.livePrices?[index].updatedAt!.difference(
                                    DateTime.now(),
                                  ).inMinutes.abs() ?? ''} دقائق ',
                          color2: const Color(0xff2a2a2a),
                        ),
                        CoulmnText(
                          text: 'السوق السوداء',
                          text2:
                              '${widget.coinsModel?.blackMarketPrices?[index].sellPrice ?? ''}',
                          color2: const Color(0xff2a2a2a),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class DialogWidget extends StatelessWidget {
  DialogWidget({super.key, required this.coinsModel});
  List<CoinsModel>? coinsModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: 327.w,
          height: 600.h,
          decoration: const BoxDecoration(
            color: Color(0xff2A2A2A),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: HomeCubit.get(context).coinsModel?.length ?? 0,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        HomeCubit.get(context).getHomeData();
                        final coinsModel =
                            HomeCubit.get(context).coinsModel?[index];
                        Navigator.pop(
                          context,
                          coinsModel,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              coinsModel?[index].name ?? '',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFFFFFF),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            CachedNetworkImage(
                              imageUrl:
                                  'http://voipsys.space/storage/${coinsModel?[index].icon ?? ''}',
                              width: 25.5.w,
                              height: 25.5.h,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
