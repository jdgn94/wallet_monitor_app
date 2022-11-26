import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/services/localStorage.dart';
import 'package:wallet_monitor/src/settings/colorSchema.dart';
import 'package:wallet_monitor/src/util/background.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final ColorSchemaApp colorSchema = ColorSchemaApp();

  Future<void> getToken() async {
    final token = LocalStorage.preferences.getString('token');
    if (token == null) {
      Navigator.popAndPushNamed(context, "/log_in");
      return;
    }

    // aqui se hace la logica para verificar el token que se tiene guardado
    Navigator.popAndPushNamed(context, "/home");
    return;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), getToken);

    return Scaffold(
      body: Scaffold(
        body: Stack(
          children: [
            const BackgroundUtil(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _logo(),
                  const SizedBox(height: 40.0),
                  CircularProgressIndicator(
                    color: colorSchema.primary,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _logo() {
    return Container(
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        color: colorSchema.primary,
        borderRadius: const BorderRadius.all(Radius.circular(100.0)),
      ),
      child: const Center(
        child: Icon(
          Icons.wallet_outlined,
          size: 100.0,
        ),
      ),
    );
  }
}
