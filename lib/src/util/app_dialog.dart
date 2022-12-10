import 'package:flutter/material.dart';
// -----------------------------
import 'package:wallet_monitor/generated/l10n.dart';
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/widgets/text_button_global.dart';

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
            TextButtonGlobal(
              text:
                  closeButtonMessage ?? S.current.dialogCancelTextBottomDefault,
              callback: () {
                Navigator.of(context).pop();
                if (callbackClose != null) callbackClose();
              },
              textColor: colorSelected("error"),
              backgroundColor: colorSelected("error"),
              size: const Size(100, 44.0),
            ),
            if (callbackConfirm != null)
              TextButtonGlobal(
                text: confirmButtonMessage ??
                    S.current.dialogConfirmTextBottomDefault,
                callback: () {
                  Navigator.of(context).pop();
                  callbackConfirm();
                },
                textColor: colorSelected(""),
                size: const Size(100, 44.0),
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
