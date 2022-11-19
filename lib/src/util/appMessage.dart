import 'package:flutter/material.dart';
import 'package:wallet_monitor/src/settings/colorSchema.dart';

class AppMessage {
  ColorSchemaApp colorScheme = ColorSchemaApp();
  AppMessage._();
  static buildMessageSnackbar(
      BuildContext context, String message, String type) {
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
                  _showIcon(type),
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
                  Icons.clear,
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

Icon _showIcon(String type) {
  if (type == "info") return const Icon(Icons.info_outline);
  if (type == "error") return const Icon(Icons.error_outline);
  if (type == "warning") return const Icon(Icons.warning_amber_outlined);
  if (type == "success") return const Icon(Icons.check_circle_outline);
  return const Icon(Icons.question_mark);
}

Color _colorSelector(String type) {
  final colorScheme = ColorSchemaApp();
  if (type == "info") return colorScheme.info;
  if (type == "error") return colorScheme.error;
  if (type == "warning") return colorScheme.warning;
  if (type == "success") return colorScheme.success;
  if (type == "message") return colorScheme.notificationText;
  return colorScheme.primary;
}
