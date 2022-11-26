import 'package:flutter/material.dart';

class TextFieldGlobal extends StatefulWidget {
  final TextEditingController textEditingController;
  final String label;
  final InputBorder inputBorder;
  final bool error;
  final String? errorText;
  final bool disabledInput;
  final bool changeObscureText;
  final bool enableSuggestions;
  final bool autocorrect;

  const TextFieldGlobal({
    Key? key,
    required this.textEditingController,
    required this.label,
    this.error = false,
    this.errorText,
    this.inputBorder = const UnderlineInputBorder(),
    this.disabledInput = false,
    this.changeObscureText = false,
    this.enableSuggestions = false,
    this.autocorrect = false,
  }) : super(key: key);

  @override
  _TextFieldGlobal createState() => _TextFieldGlobal();
}

class _TextFieldGlobal extends State<TextFieldGlobal> {
  bool obscureText = false;

  @override
  void initState() {
    if (widget.changeObscureText) obscureText = true;
    super.initState();
  }

  void pressIcon() {
    if (widget.changeObscureText)
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        obscureText = !obscureText;
      });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        label: Text(widget.label),
        border: widget.inputBorder,
        errorText: widget.error ? widget.errorText : null,
        suffixIcon: widget.changeObscureText
            ? IconButton(
                icon: iconPassShow(),
                onPressed: () => pressIcon(),
              )
            : const SizedBox(),
      ),
      enabled: !widget.disabledInput,
      obscureText: obscureText,
      enableSuggestions: widget.enableSuggestions,
      autocorrect: widget.autocorrect,
    );
  }

  Icon iconPassShow() {
    return widget.changeObscureText
        ? Icon(
            obscureText ? Icons.remove_red_eye : Icons.visibility_off,
          )
        : const Icon(null);
  }
}
