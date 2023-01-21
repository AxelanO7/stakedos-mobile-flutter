// import 'package:stakedos/app/core/base_import.dart';
// import 'package:fl_chart/fl_chart.dart';

// class UkaProgressChart extends StatelessWidget {
//   final bool isShowTooltip;
//   final double height;
//   final bool isCurved;
//   final Color? lineColor;
//   final List<LastExam?>? lastExam;
//   final EdgeInsets padding;
//   final Color? dotColor;
//   final bool isShowDot;

//   const UkaProgressChart({
//     Key? key,
//     required this.isShowTooltip,
//     required this.height,
//     required this.isCurved,
//     this.lineColor,
//     required this.lastExam,
//     required this.padding,
//     this.dotColor,
//     required this.isShowDot,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final lineBarsData = [
//       LineChartBarData(
//         showingIndicators: getIndexList(lastExam),
//         spots: getSpot(lastExam),
//         isCurved: isCurved,
//         barWidth: 3,
//         color: lineColor ?? HexColor('6BB8FF'),
//         dotData: FlDotData(show: false),
//       ),
//     ];

//     final tooltipsOnBar = lineBarsData[0];

//     return SizedBox(
//       height: height,
//       child: Padding(
//         padding: padding,
//         child: LineChart(
//           LineChartData(
//             showingTooltipIndicators: getIndexList(lastExam).map((index) {
//               return ShowingTooltipIndicators([
//                 LineBarSpot(
//                   tooltipsOnBar,
//                   lineBarsData.indexOf(tooltipsOnBar),
//                   tooltipsOnBar.spots[index],
//                 ),
//               ]);
//             }).toList(),
//             lineTouchData: isShowTooltip
//                 ? LineTouchData(
//                     enabled: false,
//                     getTouchedSpotIndicator:
//                         (LineChartBarData barData, List<int> spotIndexes) {
//                       return spotIndexes.map((index) {
//                         return TouchedSpotIndicatorData(
//                           FlLine(
//                             color: Colors.transparent,
//                           ),
//                           FlDotData(
//                             show: isShowTooltip,
//                             getDotPainter: (spot, percent, barData, index) =>
//                                 FlDotCirclePainter(
//                               radius: 8,
//                               strokeWidth: 0,
//                               color: HexColor('476BD8'),
//                               strokeColor: HexColor('476BD8'),
//                             ),
//                           ),
//                         );
//                       }).toList();
//                     },
//                     touchTooltipData: LineTouchTooltipData(
//                       tooltipBgColor: ColorStyle.whiteColor,
//                       tooltipBorder: BorderSide(
//                         width: 1,
//                         color: ColorStyle().grayscaleRange[100]!,
//                       ),
//                       tooltipPadding:
//                           EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                       tooltipRoundedRadius: 8,
//                       getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
//                         return lineBarsSpot.map((lineBarSpot) {
//                           return LineTooltipItem(
//                             lineBarSpot.y.toStringAsFixed(0),
//                             TextStyle(
//                               color: HexColor('476BD8'),
//                               fontFamily: 'VisibyRoundDemiBold',
//                               fontSize: 14,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           );
//                         }).toList();
//                       },
//                     ),
//                   )
//                 : LineTouchData(
//                     enabled: false,
//                     getTouchedSpotIndicator:
//                         (LineChartBarData barData, List<int> spotIndexes) {
//                       return spotIndexes.map((index) {
//                         return TouchedSpotIndicatorData(
//                           FlLine(
//                             color: Colors.transparent,
//                           ),
//                           FlDotData(
//                             show: isShowDot,
//                             getDotPainter: (spot, percent, barData, index) =>
//                                 FlDotCirclePainter(
//                               radius: 8,
//                               strokeWidth: 0,
//                               color: HexColor('476BD8'),
//                               strokeColor: HexColor('476BD8'),
//                             ),
//                           ),
//                         );
//                       }).toList();
//                     },
//                     touchTooltipData: LineTouchTooltipData(
//                       tooltipBgColor: Colors.transparent,
//                       tooltipBorder: BorderSide(
//                         width: 0,
//                         color: Colors.transparent,
//                       ),
//                       tooltipPadding:
//                           EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                       tooltipRoundedRadius: 8,
//                       getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
//                         return lineBarsSpot.map((lineBarSpot) {
//                           return LineTooltipItem(
//                             lineBarSpot.y.toString(),
//                             TextStyle(
//                               color: Colors.transparent,
//                               fontFamily: 'VisibyRoundDemiBold',
//                               fontSize: 14,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           );
//                         }).toList();
//                       },
//                     ),
//                   ),
//             lineBarsData: lineBarsData,
//             minY: -1,
//             minX: 1,
//             titlesData: FlTitlesData(
//               show: true,
//               leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//               rightTitles: AxisTitles(
//                 drawBehindEverything: true,
//                 sideTitles: SideTitles(
//                   showTitles: false,
//                   reservedSize: 0,
//                 ),
//               ),
//               bottomTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   reservedSize: 56,
//                   showTitles: isShowTooltip,
//                   interval: 1,
//                   getTitlesWidget: (double value, TitleMeta meta) {
//                     return Padding(
//                       padding: EdgeInsets.only(top: 8),
//                       child: Text(
//                         // TimeHelper.convertDateStringToNameDayMonth(getDateList(lastExam)[value.toInt() - 1], withSpacing: true),
//                         TimeHelper.convertTimeCustomFormatterFromISO(
//                             getDateList(lastExam)[value.toInt() - 1],
//                             'd\nMMM\ny'),
//                         textAlign: TextAlign.center,
//                         style: TypographyStyle.body3Medium.copyWith(
//                           color: ColorStyle().grayscaleRange[700],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               topTitles: AxisTitles(
//                 drawBehindEverything: true,
//                 sideTitles: SideTitles(
//                   showTitles: false,
//                   reservedSize: 0,
//                 ),
//               ),
//             ),
//             gridData: FlGridData(
//               show: true,
//               drawVerticalLine: true,
//               drawHorizontalLine: false,
//               getDrawingVerticalLine: (value) {
//                 return FlLine(
//                   color: ColorStyle().grayscaleRange[100],
//                   strokeWidth: 2,
//                 );
//               },
//             ),
//             borderData: FlBorderData(
//               show: false,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   List<FlSpot> getSpot(List<LastExam?>? lastExam) {
//     List<FlSpot> graphSpotList = [];

//     if ((lastExam?.length ?? 0) != 0 || lastExam != null) {
//       for (int i = 0; i < (lastExam?.length ?? 0); i++) {
//         graphSpotList.add(FlSpot(i + 1, (lastExam?[i]?.total.toDouble() ?? 0)));
//       }
//     }

//     return graphSpotList;
//   }

//   List<int> getIndexList(List<LastExam?>? lastExam) {
//     List<int> indexList = [];
//     if ((lastExam?.length ?? 0) != 0 || lastExam != null) {
//       for (int i = 0; i < (lastExam?.length ?? 0); i++) {
//         indexList.add(i);
//       }
//     }

//     return indexList;
//   }

//   List<String> getDateList(List<LastExam?>? lastExam) {
//     List<String> dateList = [];
//     if ((lastExam?.length ?? 0) != 0 || lastExam != null) {
//       for (int i = 0; i < (lastExam?.length ?? 0); i++) {
//         dateList.add(lastExam?[i]?.createdAt ?? '');
//       }
//     }
//     return dateList;
//   }
// }
