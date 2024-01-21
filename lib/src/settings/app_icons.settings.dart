import 'package:flutter/material.dart';

IconData getIcon(String name) {
  switch (name) {
    case "account":
      return Icons.wallet;
    case "transaction":
      return Icons.money;
    case "budgets":
      return Icons.show_chart_rounded;
    case "more":
      return Icons.more_horiz_rounded;
    case "add":
      return Icons.add_rounded;
    default:
      return Icons.question_mark_rounded;
  }
}
