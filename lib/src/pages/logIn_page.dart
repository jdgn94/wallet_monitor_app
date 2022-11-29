import 'package:flutter/material.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/util/app_message.dart';
import 'package:wallet_monitor/src/util/background.dart';
import 'package:wallet_monitor/src/widgets/box_container.dart';
import 'package:wallet_monitor/src/widgets/button_global.dart';
import 'package:wallet_monitor/src/widgets/text_button.dart';
import 'package:wallet_monitor/src/widgets/text_field.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _usernameEmailController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _usernameEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  redirect(String route) {
    Navigator.popAndPushNamed(context, route);
  }

  checkInputs() {
    final usernameEmail = _usernameEmailController.value.text;
    final password = _usernameEmailController.value.text;

    if (usernameEmail.isEmpty || password.isEmpty) {
      AppMessage.buildMessageSnackbar(
        context,
        S.current.logInError,
        "error",
      );
      return;
    }

    return redirect("/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundUtil(),
          Center(
            child: BoxContainer(
              title: S.current.logIn,
              components: [
                TextFieldGlobal(
                  textEditingController: _usernameEmailController,
                  label: S.current.emailUsername,
                ),
                TextFieldGlobal(
                  textEditingController: _passwordController,
                  label: S.current.password,
                  changeObscureText: true,
                ),
                ButtonGlobal(
                  text: S.current.logIn,
                  callback: checkInputs,
                ),
                TextButtonGlobal(
                  text: S.current.signUp,
                  callback: () => redirect("/sign_up"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
