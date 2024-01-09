
    import 'package:black_market/features/home/data/models/chart_model/currency_id.dart';
import 'package:black_market/features/home/presentation/cubit/home_cubit.dart';
import 'package:black_market/features/home/presentation/cubit/home_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xffF0E703),
    const Color(0xffB3DFA1)
  ];
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      List<CurrencyId> currencyData = HomeCubit.get(context).currencyId ?? [];

      List<CurrencyId> filteredData =
          currencyData.where((e) => e.hour == 0).toList();

      return Padding(
        padding: const EdgeInsets.all(10),
        child: SfCartesianChart(
          // tooltipBehavior: TooltipBehavior(enable: true),
          borderWidth: 0,
          plotAreaBorderWidth: 0,
          enableAxisAnimation: true,

          // onTooltipRender: (TooltipArgs args) {
          //   args.text = '${args.text} ${args.dataPoints![0].y}';
          // },
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
              // Format the date here using the intl package
              DateTime dateTime = DateTime.parse(value.text);
              return ChartAxisLabel(
                  DateFormat('MMM dd').format(
                    dateTime,
                  ),
                  value.textStyle);
            },
          ),

          series: <CartesianSeries>[
            AreaSeries<CurrencyId, String>(
              color: const Color(0xffF0E703).withOpacity(0.5),

              // Bind data source
              dataSource: filteredData,

              xValueMapper: (CurrencyId sales, _) => sales.date,
              yValueMapper: (CurrencyId sales, _) => sales.price,
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


// Widget bottomTitleWidgets(double value, TitleMeta meta) {

//   const style = TextStyle(
//     fontWeight: FontWeight.w400,
//     fontSize: 14,
//   );
//   Widget text;
//   switch (value.toInt()) {
//     case 2:
//       text = const Text('MAR', style: style);
//       break;
//     case 5:
//       text = const Text('JUN', style: style);
//       break;
//     case 8:
//       text = const Text('SEP', style: style);
//       break;
//     default:
//       text = const Text('', style: style);
//       break;
//   }

//   return SideTitleWidget(
//     axisSide: meta.axisSide,
//     child: text,
//   );
// }

// Widget leftTitleWidgets(double value, TitleMeta meta) {
//   const style = TextStyle(
//     fontWeight: FontWeight.bold,
//     fontSize: 15,
//   );
//   String text;
//   switch (value.toInt()) {
//     case 1:
//       text = '10K';
//       break;
//     case 3:
//       text = '30k';
//       break;
//     case 5:
//       text = '50k';
//       break;
//     default:
//       return Container();
//   }

//   return Text(text, style: style, textAlign: TextAlign.left);
// }

// LineChartData mainData() {
//   return LineChartData(
//     titlesData: const FlTitlesData(
//       bottomTitles: AxisTitles(
//         axisNameWidget: DefaultTabController(
//           length: 6,
//           child: TabBar(
//             isScrollable: true,
//             tabs: [
//               Text('سبت'),
//               Text('أحد'),
//               Text('إثنين'),
//               Text('ثلاثاء'),
//               Text('أربعاء'),
//               Text(
//                 'خميس',
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     gridData: const FlGridData(
//       show: true,
//       drawVerticalLine: true,
//       horizontalInterval: 1,
//       verticalInterval: 1,
//     ),
//     borderData: FlBorderData(
//       show: true,
//       border: Border.all(color: const Color(0xff37434d)),
//     ),
//     minX: 0,
//     maxX: 11,
//     minY: 0,
//     maxY: 6,
//     lineBarsData: [
//       LineChartBarData(
//         spots: const [
//           FlSpot(0, 3),
//           FlSpot(2.6, 2),
//           FlSpot(4.9, 5),
//           FlSpot(6.8, 3.1),
//           FlSpot(8, 4),
//           FlSpot(9.5, 3),
//           FlSpot(11, 4),
//         ],
//         isCurved: true,
//         gradient: LinearGradient(
//           colors: gradientColors,
//         ),
//         barWidth: 5,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(
//           show: false,
//         ),
//         belowBarData: BarAreaData(
//           show: true,
//           gradient: LinearGradient(
//             colors: gradientColors
//                 .map((color) => color.withOpacity(0.3))
//                 .toList(),
//           ),
//         ),
//       ),
//     ],
//   );
// }

// LineChartData avgData() {
//   return LineChartData(
//     lineTouchData: const LineTouchData(enabled: false),
//     gridData: FlGridData(
//       show: true,
//       drawHorizontalLine: true,
//       verticalInterval: 1,
//       horizontalInterval: 1,
//       getDrawingVerticalLine: (value) {
//         return const FlLine(
//           color: Color(0xff37434d),
//           strokeWidth: 1,
//         );
//       },
//       getDrawingHorizontalLine: (value) {
//         return const FlLine(
//           color: Color(0xff37434d),
//           strokeWidth: 1,
//         );
//       },
//     ),
//     titlesData: FlTitlesData(
//       show: true,
//       bottomTitles: AxisTitles(
//         sideTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 30,
//           getTitlesWidget: bottomTitleWidgets,
//           interval: 1,
//         ),
//       ),
//       leftTitles: AxisTitles(
//         sideTitles: SideTitles(
//           showTitles: true,
//           getTitlesWidget: leftTitleWidgets,
//           reservedSize: 42,
//           interval: 1,
//         ),
//       ),
//       topTitles: const AxisTitles(
//         sideTitles: SideTitles(showTitles: false),
//       ),
//       rightTitles: const AxisTitles(
//         sideTitles: SideTitles(showTitles: false),
//       ),
//     ),
//     borderData: FlBorderData(
//       show: true,
//       border: Border.all(color: const Color(0xff37434d)),
//     ),
//     minX: 0,
//     maxX: 11,
//     minY: 0,
//     maxY: 6,
//     lineBarsData: [
//       LineChartBarData(
//         spots: const [
//           FlSpot(0, 3.44),
//           FlSpot(2.6, 3.44),
//           FlSpot(4.9, 3.44),
//           FlSpot(6.8, 3.44),
//           FlSpot(8, 3.44),
//           FlSpot(9.5, 3.44),
//           FlSpot(11, 3.44),
//         ],
//         isCurved: true,
//         gradient: LinearGradient(
//           colors: [
//             ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                 .lerp(0.2)!,
//             ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                 .lerp(0.2)!,
//           ],
//         ),
//         barWidth: 5,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(
//           show: false,
//         ),
//         belowBarData: BarAreaData(
//           show: true,
//           gradient: LinearGradient(
//             colors: [
//               ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                   .lerp(0.2)!
//                   .withOpacity(0.1),
//               ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                   .lerp(0.2)!
//                   .withOpacity(0.1),
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }



// Widget bottomTitleWidgets(double value, TitleMeta meta) {

//   const style = TextStyle(
//     fontWeight: FontWeight.w400,
//     fontSize: 14,
//   );
//   Widget text;
//   switch (value.toInt()) {
//     case 2:
//       text = const Text('MAR', style: style);
//       break;
//     case 5:
//       text = const Text('JUN', style: style);
//       break;
//     case 8:
//       text = const Text('SEP', style: style);
//       break;
//     default:
//       text = const Text('', style: style);
//       break;
//   }

//   return SideTitleWidget(
//     axisSide: meta.axisSide,
//     child: text,
//   );
// }

// Widget leftTitleWidgets(double value, TitleMeta meta) {
//   const style = TextStyle(
//     fontWeight: FontWeight.bold,
//     fontSize: 15,
//   );
//   String text;
//   switch (value.toInt()) {
//     case 1:
//       text = '10K';
//       break;
//     case 3:
//       text = '30k';
//       break;
//     case 5:
//       text = '50k';
//       break;
//     default:
//       return Container();
//   }

//   return Text(text, style: style, textAlign: TextAlign.left);
// }

// LineChartData mainData() {
//   return LineChartData(
//     titlesData: const FlTitlesData(
//       bottomTitles: AxisTitles(
//         axisNameWidget: DefaultTabController(
//           length: 6,
//           child: TabBar(
//             isScrollable: true,
//             tabs: [
//               Text('سبت'),
//               Text('أحد'),
//               Text('إثنين'),
//               Text('ثلاثاء'),
//               Text('أربعاء'),
//               Text(
//                 'خميس',
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     gridData: const FlGridData(
//       show: true,
//       drawVerticalLine: true,
//       horizontalInterval: 1,
//       verticalInterval: 1,
//     ),
//     borderData: FlBorderData(
//       show: true,
//       border: Border.all(color: const Color(0xff37434d)),
//     ),
//     minX: 0,
//     maxX: 11,
//     minY: 0,
//     maxY: 6,
//     lineBarsData: [
//       LineChartBarData(
//         spots: const [
//           FlSpot(0, 3),
//           FlSpot(2.6, 2),
//           FlSpot(4.9, 5),
//           FlSpot(6.8, 3.1),
//           FlSpot(8, 4),
//           FlSpot(9.5, 3),
//           FlSpot(11, 4),
//         ],
//         isCurved: true,
//         gradient: LinearGradient(
//           colors: gradientColors,
//         ),
//         barWidth: 5,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(
//           show: false,
//         ),
//         belowBarData: BarAreaData(
//           show: true,
//           gradient: LinearGradient(
//             colors: gradientColors
//                 .map((color) => color.withOpacity(0.3))
//                 .toList(),
//           ),
//         ),
//       ),
//     ],
//   );
// }

// LineChartData avgData() {
//   return LineChartData(
//     lineTouchData: const LineTouchData(enabled: false),
//     gridData: FlGridData(
//       show: true,
//       drawHorizontalLine: true,
//       verticalInterval: 1,
//       horizontalInterval: 1,
//       getDrawingVerticalLine: (value) {
//         return const FlLine(
//           color: Color(0xff37434d),
//           strokeWidth: 1,
//         );
//       },
//       getDrawingHorizontalLine: (value) {
//         return const FlLine(
//           color: Color(0xff37434d),
//           strokeWidth: 1,
//         );
//       },
//     ),
//     titlesData: FlTitlesData(
//       show: true,
//       bottomTitles: AxisTitles(
//         sideTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 30,
//           getTitlesWidget: bottomTitleWidgets,
//           interval: 1,
//         ),
//       ),
//       leftTitles: AxisTitles(
//         sideTitles: SideTitles(
//           showTitles: true,
//           getTitlesWidget: leftTitleWidgets,
//           reservedSize: 42,
//           interval: 1,
//         ),
//       ),
//       topTitles: const AxisTitles(
//         sideTitles: SideTitles(showTitles: false),
//       ),
//       rightTitles: const AxisTitles(
//         sideTitles: SideTitles(showTitles: false),
//       ),
//     ),
//     borderData: FlBorderData(
//       show: true,
//       border: Border.all(color: const Color(0xff37434d)),
//     ),
//     minX: 0,
//     maxX: 11,
//     minY: 0,
//     maxY: 6,
//     lineBarsData: [
//       LineChartBarData(
//         spots: const [
//           FlSpot(0, 3.44),
//           FlSpot(2.6, 3.44),
//           FlSpot(4.9, 3.44),
//           FlSpot(6.8, 3.44),
//           FlSpot(8, 3.44),
//           FlSpot(9.5, 3.44),
//           FlSpot(11, 3.44),
//         ],
//         isCurved: true,
//         gradient: LinearGradient(
//           colors: [
//             ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                 .lerp(0.2)!,
//             ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                 .lerp(0.2)!,
//           ],
//         ),
//         barWidth: 5,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(
//           show: false,
//         ),
//         belowBarData: BarAreaData(
//           show: true,
//           gradient: LinearGradient(
//             colors: [
//               ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                   .lerp(0.2)!
//                   .withOpacity(0.1),
//               ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                   .lerp(0.2)!
//                   .withOpacity(0.1),
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }
