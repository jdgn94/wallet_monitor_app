import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/widgets/personal_app_bar.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersonalAppBar(
        title: "Nav Title",
      ),
    );
  }
}
