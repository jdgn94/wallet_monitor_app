import 'package:flutter/material.dart';
// -----------------------------
import 'package:wallet_monitor/src/localStorage/settings.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/background.dart';
import 'package:wallet_monitor/src/util/icons.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final ColorSchemaApp colorSchema = ColorSchemaApp();
  final pref = SettingsLocalStorage.pref;

  Future<void> getToken() async {
    final token = pref.getString('token');
    if (token == null) {
      Navigator.popAndPushNamed(context, "/log_in");
      return;
    }

    if (token == "noUseInternet") {
      Navigator.popAndPushNamed(context, "/expenses");
      return;
    }
    // aquí se hace la lógica para verificar el token que se tiene guardado
    Navigator.popAndPushNamed(context, "/expenses");
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
      child: Center(
        child: Icon(
          getIcon('splash'),
          size: 100.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
