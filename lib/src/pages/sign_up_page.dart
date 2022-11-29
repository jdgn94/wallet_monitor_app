import 'package:flutter/material.dart';
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/app_dialog.dart';
import 'package:wallet_monitor/src/util/app_message.dart';
import 'package:wallet_monitor/src/util/background.dart';
import 'package:wallet_monitor/src/widgets/box_container.dart';
import 'package:wallet_monitor/src/widgets/button_global.dart';
import 'package:wallet_monitor/src/widgets/text_button.dart';
import 'package:wallet_monitor/src/widgets/text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _errorUsername = true;
  bool _errorEmail = true;
  bool _errorPassword = true;
  bool _errorPasswordCharacterLower = true;
  bool _errorPasswordCharacterUpper = true;
  bool _errorPasswordCharacterNumber = true;
  bool _errorPasswordCharacterSpecial = true;
  bool _errorPasswordCharacterLength = true;
  bool _verifyInServer = false;
  final ColorSchemaApp colorSchema = ColorSchemaApp();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp regExpUsername = RegExp(r'^[a-zA-Z\d\._\-]{4,32}$');
  final RegExp regExpEmail =
      RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})$');
  final RegExp regExpPassword = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[\d])(?=.*[$@!%*?&#\._\-])[a-zA-z\d$@!%*?&#\._\-]{8,64}$');

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      checkUsername(_usernameController.value.text);
    });
    _emailController.addListener(() {
      checkEmail(_emailController.value.text);
    });
    _passwordController.addListener(() {
      checkPassword(_passwordController.value.text);
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void redirect(String route) {
    Navigator.popAndPushNamed(context, route);
  }

  void openDialog() {
    AppDialog.buildMessageDialog(
      context,
      requirements(),
      null,
      null,
      null,
      null,
      null,
    );
  }

  void checkUsername(String text) {
    if (regExpUsername.hasMatch(text)) {
      return setState(() {
        _errorUsername = false;
      });
    }
    return setState(() {
      _errorUsername = true;
    });
  }

  void checkEmail(String text) {
    if (regExpEmail.hasMatch(text)) {
      return setState(() {
        _errorEmail = false;
      });
    }
    return setState(() {
      _errorEmail = true;
    });
  }

  void checkPassword(String text) {
    if (regExpPassword.hasMatch(text)) {
      return setState(() {
        _errorPassword = false;
        _errorPasswordCharacterLower = false;
        _errorPasswordCharacterUpper = false;
        _errorPasswordCharacterNumber = false;
        _errorPasswordCharacterSpecial = false;
        _errorPasswordCharacterLength = false;
      });
    }

    if (RegExp(r'(?=.*[A-Z])').hasMatch(text)) {
      _errorPasswordCharacterUpper = false;
    } else {
      _errorPasswordCharacterUpper = true;
    }

    if (RegExp(r'(?=.*[a-z])').hasMatch(text)) {
      _errorPasswordCharacterLower = false;
    } else {
      _errorPasswordCharacterLower = true;
    }

    if (RegExp(r'(?=.*[\d])').hasMatch(text)) {
      _errorPasswordCharacterNumber = false;
    } else {
      _errorPasswordCharacterNumber = true;
    }

    if (RegExp(r'(?=.*[$@!%*?&#\._\-])').hasMatch(text)) {
      _errorPasswordCharacterSpecial = false;
    } else {
      _errorPasswordCharacterSpecial = true;
    }

    if (text.length >= 8 && text.length <= 64) {
      _errorPasswordCharacterLength = false;
    } else {
      _errorPasswordCharacterLength = true;
    }

    _errorPassword = true;
    setState(() {});
  }

  void checkInputs() {
    if (_errorUsername) {
      AppMessage.buildMessageSnackbar(
        context,
        S.current.usernameErrorInput,
        "error",
      );
      return;
    }

    if (_errorEmail) {
      AppMessage.buildMessageSnackbar(
        context,
        S.current.emailErrorInput,
        "error",
      );
      return;
    }

    if (_errorPassword) {
      AppMessage.buildMessageSnackbar(
        context,
        S.current.passwordErrorInput,
        "error",
      );
      return;
    }

    setState(() {
      _verifyInServer = true;
    });
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        setState(() {
          _verifyInServer = false;
        });
      },
    );
    // redirect("/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            const BackgroundUtil(),
            Center(
              child: BoxContainer(
                title: "Sign Up",
                height: 420.0,
                components: [
                  TextFieldGlobal(
                    textEditingController: _usernameController,
                    label: S.current.username,
                    errorText: S.current.emailErrorInput,
                    error: _errorUsername,
                    disabledInput: _verifyInServer,
                  ),
                  TextFieldGlobal(
                    textEditingController: _emailController,
                    label: S.current.email,
                    errorText: S.current.emailErrorInput,
                    error: _errorEmail,
                    disabledInput: _verifyInServer,
                  ),
                  TextFieldGlobal(
                    textEditingController: _passwordController,
                    label: S.current.password,
                    changeObscureText: true,
                    errorText: S.current.passwordErrorInput,
                    error: _errorPassword,
                    disabledInput: _verifyInServer,
                  ),
                  ButtonGlobal(
                    text: S.current.signUp,
                    callback: checkInputs,
                    disabledButton: _verifyInServer,
                    loading: _verifyInServer,
                  ),
                  TextButtonGlobal(
                    text: S.current.requirements,
                    icon: Icons.info_outline,
                    callback: openDialog,
                    disabledButton: _verifyInServer,
                  ),
                  TextButtonGlobal(
                    text: S.current.logIn,
                    callback: () => redirect("/log_in"),
                    disabledButton: _verifyInServer,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox requirements() {
    return SizedBox(
      width: 700.0,
      height: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          requirementUsername(),
          requirementEmail(),
          requirementPassword(),
        ],
      ),
    );
  }

  Row requirementUsername() {
    final Color colorText =
        _errorUsername ? colorSchema.error : colorSchema.success;
    return messageErrorGenerator(
      colorText,
      S.current.usernameSuccess,
      S.current.usernameError,
      _errorUsername,
    );
  }

  Row requirementEmail() {
    final Color colorText =
        _errorEmail ? colorSchema.error : colorSchema.success;
    return messageErrorGenerator(
      colorText,
      S.current.emailSuccess,
      S.current.emailError,
      _errorEmail,
    );
  }

  SizedBox requirementPassword() {
    final Color colorTextTotal =
        _errorPassword ? colorSchema.error : colorSchema.success;
    final Color colorTextLower =
        _errorPasswordCharacterLower ? colorSchema.error : colorSchema.success;
    final Color colorTextUpper =
        _errorPasswordCharacterUpper ? colorSchema.error : colorSchema.success;
    final Color colorTextNumber =
        _errorPasswordCharacterNumber ? colorSchema.error : colorSchema.success;
    final Color colorTextSpecial = _errorPasswordCharacterSpecial
        ? colorSchema.error
        : colorSchema.success;
    final Color colorTextLength =
        _errorPasswordCharacterLength ? colorSchema.error : colorSchema.success;
    return SizedBox(
      child: Column(
        children: [
          messageErrorGenerator(
            colorTextTotal,
            S.current.passwordSuccess,
            S.current.passwordError,
            _errorPassword,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: messageErrorGenerator(
              colorTextLower,
              S.current.passwordSuccessRequirementLower,
              S.current.passwordErrorRequirementLower,
              _errorPasswordCharacterLower,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: messageErrorGenerator(
              colorTextUpper,
              S.current.passwordSuccessRequirementUpper,
              S.current.passwordErrorRequirementUpper,
              _errorPasswordCharacterUpper,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: messageErrorGenerator(
              colorTextNumber,
              S.current.passwordSuccessRequirementNumber,
              S.current.passwordErrorRequirementNumber,
              _errorPasswordCharacterNumber,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: messageErrorGenerator(
              colorTextSpecial,
              S.current.passwordSuccessRequirementSpecial,
              S.current.passwordErrorRequirementSpecial,
              _errorPasswordCharacterSpecial,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: messageErrorGenerator(
              colorTextLength,
              S.current.passwordSuccessRequirementLength,
              S.current.passwordErrorRequirementLength,
              _errorPasswordCharacterLength,
            ),
          ),
        ],
      ),
    );
  }

  Row messageErrorGenerator(
    Color color,
    String messageSuccess,
    String messageError,
    bool error,
  ) {
    return Row(
      children: [
        Icon(
          error ? Icons.clear : Icons.check,
          color: color,
        ),
        const SizedBox(width: 10.0),
        Container(
          width: MediaQuery.of(context).size.width - 200,
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(
            error ? messageError : messageSuccess,
            style: TextStyle(color: color),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
