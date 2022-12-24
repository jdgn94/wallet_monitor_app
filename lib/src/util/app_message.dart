import 'package:flutter/material.dart';
// -----------------------------
import 'package:wallet_monitor/src/settings/color_schema.dart';
import 'package:wallet_monitor/src/util/icons.dart';

class AppMessage {
  AppMessage._();
  static buildMessageSnackbar(
    BuildContext context,
    String message,
    String type,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: _colorSelector(type),
        duration: const Duration(seconds: 10),
        content: Container(
          constraints: const BoxConstraints(maxHeight: 50.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    getIcon(type),
                    color: _colorSelector("message"),
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 125.0,
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        color: _colorSelector("message"),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                icon: Icon(
                  getIcon('clear'),
                  color: _colorSelector("message"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color _colorSelector(String type) {
  final colorScheme = ColorSchemaApp();
  if (type == "info") return colorScheme.info;
  if (type == "error") return colorScheme.error;
  if (type == "warning") return colorScheme.warning;
  if (type == "success") return colorScheme.success;
  if (type == "message") return colorScheme.notificationText;
  return colorScheme.secondary;
}
