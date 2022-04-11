import 'package:flutter/material.dart';

Future<DateTime?> showCustomDatePicker(
  final BuildContext context, {
  final DateTime? firstDate,
}) {
  final DateTime now = DateTime.now();
  return showDatePicker(
    context: context,
    initialDate: now,
    firstDate: firstDate ?? DateTime(now.year - 4),
    lastDate: DateTime(now.year + 5),
  );
}
