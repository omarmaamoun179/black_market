import 'package:black_market/features/home/data/models/chart_model/currency_id_blackm.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartSample1 extends StatelessWidget {
  const LineChartSample1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      DateTime startDate = HomeCubit.get(context).startDate ?? DateTime.now();
      DateTime now = DateTime.now();
      bool isToday = DateTime(startDate.year, startDate.month, startDate.day) ==
          DateTime(now.year, now.month, now.day);
      print("Start Date: ${HomeCubit.get(context).startDate}");
      List<CurrencyIdBlack> currencyData =
          HomeCubit.get(context).currencyIdBlack ?? [];

      List<CurrencyIdBlack> filteredData =
          currencyData.where((e) => e.hour == 0).toList();

      return Padding(
        padding: const EdgeInsets.all(10),
        child: SfCartesianChart(
          // tooltipBehavior: TooltipBehavior(enable: true),
          borderWidth: 0,
          plotAreaBorderWidth: 0,
          enableAxisAnimation: true,

          trackballBehavior: TrackballBehavior(
            enable: true,
            tooltipSettings: const InteractiveTooltip(
              enable: true,
              color: Colors.white,
              format: 'point.y',
              borderWidth: 0,
              borderColor: Colors.transparent,
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            lineType: TrackballLineType.vertical,
            lineColor: Colors.grey.withOpacity(0.5),
            lineWidth: 1,
            activationMode: ActivationMode.singleTap,
            tooltipAlignment: ChartAlignment.center,
            shouldAlwaysShow: true,
          ),

          // Initialize category axis
          primaryYAxis: NumericAxis(
            interval: 3,
            isVisible: true,
            decimalPlaces: 2,
            labelFormat:
                '{value} ${HomeCubit.get(context).getCurrencyCode(HomeCubit.get(context).coinsModel?[0].name ?? '').tr()}',
            labelStyle: TextStyle(
              color: Colors.yellow.withOpacity(.5),
              fontSize: 12.sp,
            ),

            majorGridLines: const MajorGridLines(width: 0),
            //Hide the axis line of x-axis
            // axisLine: const AxisLine(width: 0),
          ),
          primaryXAxis: CategoryAxis(
            majorGridLines: const MajorGridLines(width: 0),
            // //Hide the axis line of x-axis
            // axisLine: const AxisLine(width: 0),
            labelAlignment: LabelAlignment.start,

            axisLabelFormatter: (value) {
              // Convert the timestamp to a DateTime
              DateTime dateTime = isToday
                  ? DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, value.value.toInt() % 24)
                  : DateTime.parse(value.text);

              return isToday
                  ? ChartAxisLabel(
                      DateFormat(
                        'h:mm a',
                      ).format(dateTime),
                      value.textStyle)
                  : ChartAxisLabel(
                      DateFormat("yMMMd").format(dateTime), value.textStyle);
            },
          ),

          series: <CartesianSeries>[
            AreaSeries<CurrencyIdBlack, dynamic>(
              color: const Color(0xffF0E703).withOpacity(0.5),

              // Bind data source
              dataSource: isToday
                  ? HomeCubit.get(context).currencyIdBlack ?? []
                  : filteredData,

              xValueMapper: (CurrencyIdBlack currencies, _) {
                return isToday ? currencies.hour : currencies.date;
              },
              yValueMapper: (CurrencyIdBlack currencies, _) => currencies.price,
              dataLabelSettings: DataLabelSettings(
                  useSeriesColor: true,
                  labelAlignment: ChartDataLabelAlignment.middle,
                  isVisible: true,
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  builder: (dynamic data, dynamic point, dynamic series,
                      int pointIndex, int seriesIndex) {
                    return SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.circle,
                        color: Colors.yellow,
                        size: 10.sp,
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
