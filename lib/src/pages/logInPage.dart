import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/util/appMessage.dart';
import 'package:wallet_monitor/src/util/background.dart';
import 'package:wallet_monitor/src/widgets/boxContainer.dart';
import 'package:wallet_monitor/src/widgets/textField.dart';

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
        "Username/Email or Password is not correct",
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
              title: "Log In",
              components: [
                TextFieldGlobal(
                  textEditingController: _usernameEmailController,
                  label: "Email or Username",
                ),
                TextFieldGlobal(
                  textEditingController: _passwordController,
                  label: "Password",
                  changeObscureText: true,
                ),
                logInButton(),
                linkToSignUp(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton logInButton() {
    return ElevatedButton(
      onPressed: () => checkInputs(),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 44.0),
      ),
      child: const Text(
        "Log In",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  GestureDetector linkToSignUp() {
    return GestureDetector(
      onTap: () => redirect("/sign_up"),
      child: const Text("Sign Up"),
    );
  }
}
