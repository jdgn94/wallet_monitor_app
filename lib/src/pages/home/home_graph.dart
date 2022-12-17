import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/platform_info.dart';

class _LineChart extends StatelessWidget {
  _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;
  final colorSchema = ColorSchemaApp();

  @override
  Widget build(BuildContext context) {
    return LineChart(
      linearData,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get linearData => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: 0,
        maxX: 14,
        maxY: 4,
        minY: 0,
      );

  LineTouchData get lineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData => [
        lineChartBarData,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      // color: Color(0xff75729e),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1k';
        break;
      case 2:
        text = '2k';
        break;
      case 3:
        text = '3k';
        break;
      case 4:
        text = '4k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('5', style: style);
        break;
      case 4:
        text = const Text('10', style: style);
        break;
      case 6:
        text = const Text('15', style: style);
        break;
      case 8:
        text = const Text('20', style: style);
        break;
      case 10:
        text = const Text('25', style: style);
        break;
      case 12:
        text = const Text('30', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xff4e4965), width: 4),
          left: BorderSide(color: Color(0xff4e4965), width: 4),
        ),
      );

  LineChartBarData get lineChartBarData => LineChartBarData(
        isCurved: true,
        color: colorSchema.primary,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 0.1),
          FlSpot(3, 0.17),
          FlSpot(5, 0.5),
          FlSpot(7, 0.76),
          FlSpot(10, 0.95),
          FlSpot(11.5, 1.7),
          FlSpot(12.5, 2.36141),
        ],
      );
}

class HomeGraphWidget extends StatefulWidget {
  const HomeGraphWidget({super.key});

  @override
  State<HomeGraphWidget> createState() => _HomeGraphWidgetState();
}

class _HomeGraphWidgetState extends State<HomeGraphWidget> {
  late bool isShowingMainData;
  bool get isDesktopOrWeb => PlatformInfo().isDesktopOrWeb();

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return _graph();
  }

  Widget _graph() {
    return AspectRatio(
      aspectRatio: 1.23,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          color: _colorSelector(context),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 37,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16, left: 6),
                    child: _LineChart(isShowingMainData: isShowingMainData),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _colorSelector(BuildContext context) {
    if (Theme.of(context).colorScheme.brightness == Brightness.dark) {
      return Colors.grey.shade900;
    }

    return Colors.grey.shade200;
  }
}
