import 'package:flutter/material.dart';

class AccountInitScreen extends StatefulWidget {
  const AccountInitScreen({Key? key}) : super(key: key);

  @override
  State<AccountInitScreen> createState() => _AccountInitScreenState();
}

class _AccountInitScreenState extends State<AccountInitScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
