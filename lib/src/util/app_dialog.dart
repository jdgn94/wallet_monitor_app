import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';

class AppDialog {
  AppDialog._();

  static buildMessageDialog(
    BuildContext context,
    Widget widgets,
    String? title,
    String? closeButtonMessage,
    Function? callbackClose,
    String? confirmButtonMessage,
    Function? callbackConfirm,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? ""),
          content: widgets,
          actions: [
            if (callbackConfirm != null)
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  callbackConfirm();
                },
                child: Text(
                  confirmButtonMessage ?? "OK",
                  style: TextStyle(color: colorSelected("")),
                ),
              ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (callbackClose != null) callbackClose();
              },
              child: Text(
                closeButtonMessage ?? "Close",
                style: TextStyle(color: colorSelected("error")),
              ),
            ),
          ],
        );
      },
    );
  }
}

Color colorSelected(String type) {
  ColorSchemaApp colorScheme = ColorSchemaApp();
  if (type == "error") return colorScheme.error;
  return colorScheme.primary;
}
