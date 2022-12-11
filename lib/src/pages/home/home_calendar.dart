import 'package:flutter/material.dart';

import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/pages/home/home_graph.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/widgets/icon_button.dart';

class HomeCalendarWidget extends StatefulWidget {
  const HomeCalendarWidget({super.key});

  @override
  State<HomeCalendarWidget> createState() => _HomeCalendarWidgetState();
}

class _HomeCalendarWidgetState extends State<HomeCalendarWidget> {
  final colorSchema = ColorSchemaApp();
  late double _actualPage;
  late PageController _controller;

  @override
  void initState() {
    final month = DateTime.now().month;
    super.initState();
    _controller = PageController(initialPage: month - 1);
    _controller.addListener(onChangePage);
    _actualPage = month - 1;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onChangePage() {
    setState(() {
      _actualPage = _controller.page!;
    });
  }

  void previousPage() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _selector(),
        _expenses(),
        _graph(),
      ],
    );
  }

  Widget _selector() {
    return SizedBox(
      height: 30.0,
      child: Stack(
        children: [
          PageView(
            pageSnapping: true,
            allowImplicitScrolling: true,
            controller: _controller,
            children: [
              monthSelector(S.current.jan),
              monthSelector(S.current.feb),
              monthSelector(S.current.mar),
              monthSelector(S.current.apr),
              monthSelector(S.current.may),
              monthSelector(S.current.jun),
              monthSelector(S.current.jul),
              monthSelector(S.current.aug),
              monthSelector(S.current.sep),
              monthSelector(S.current.oct),
              monthSelector(S.current.nov),
              monthSelector(S.current.dic),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButtonGlobal(
                icon: Icons.arrow_back_ios_new_rounded,
                onPressed: previousPage,
                color: colorSchema.primary,
                disabled: _actualPage <= 0,
              ),
              IconButtonGlobal(
                icon: Icons.arrow_forward_ios_rounded,
                onPressed: nextPage,
                color: colorSchema.primary,
                disabled: _actualPage >= 11,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget monthSelector(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _expenses() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: const [
          Text(
            "\$2361,41",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
          ),
          Text(
            "total expenses",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  Widget _graph() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 270.0,
      child: HomeGraphWidget(),
    );
  }
}
