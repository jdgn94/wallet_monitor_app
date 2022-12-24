import 'package:flutter/material.dart';
// -----------------------------
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/localStorage/settings.dart';
import 'package:wallet_monitor/src/services/http.dart';
import 'package:wallet_monitor/src/util/app_dialog.dart';
import 'package:wallet_monitor/src/util/app_message.dart';
import 'package:wallet_monitor/src/util/background.dart';
import 'package:wallet_monitor/src/widgets/box_container.dart';
import 'package:wallet_monitor/src/widgets/button_global.dart';
import 'package:wallet_monitor/src/widgets/text_button_global.dart';
import 'package:wallet_monitor/src/widgets/text_field_global.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _usernameEmailController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final pref = SettingsLocalStorage.pref;
  bool loading = false;

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

  void redirect(String route) {
    Navigator.popAndPushNamed(context, route);
  }

  Future<void> checkInputs() async {
    final usernameEmail = _usernameEmailController.value.text;
    final password = _passwordController.value.text;

    if (usernameEmail.isEmpty || password.isEmpty) {
      AppMessage.buildMessageSnackbar(
        context,
        S.current.logInError,
        "error",
      );
      return;
    }

    setState(() {
      loading = true;
    });

    try {
      final response = await HttpServices().logIn(usernameEmail, password);
      if (response['status'] == 'success') {
        redirect('/home');
        return;
      }
      print("El fetch dio un error $response");
      // ignore: use_build_context_synchronously
      AppMessage.buildMessageSnackbar(
        context,
        response['message'] ?? "No message",
        response['status'] ?? "error",
      );
    } catch (e) {
      print(e);
    }

    setState(() {
      loading = false;
    });

    // redirect("/home");
    // return;
  }

  Future<void> confirmLogInWithAccount() async {
    await pref.setString('token', "noUseInternet");
    redirect("/home");
  }

  void logInWithoutAccount() {
    AppDialog.buildMessageDialog(
      context,
      Text(S.current.dialogNoAccountText),
      S.current.dialogNoAccountTitle,
      S.current.dialogCancelTextBottom,
      null,
      S.current.dialogConfirmTextBottomDefault,
      confirmLogInWithAccount,
    );
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
                  disabledInput: loading,
                ),
                TextFieldGlobal(
                  textEditingController: _passwordController,
                  label: S.current.password,
                  changeObscureText: true,
                  disabledInput: loading,
                ),
                ButtonGlobal(
                  text: S.current.logIn,
                  callback: checkInputs,
                  loading: loading,
                ),
                TextButtonGlobal(
                  text: S.current.signUp,
                  callback: () => redirect("/sign_up"),
                  disabledButton: loading,
                ),
                TextButtonGlobal(
                  text: S.current.noAccount,
                  callback: () => logInWithoutAccount(),
                  disabledButton: loading,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
