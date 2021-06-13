import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// It shows a date divider depending on the date difference
class DateDivider extends StatelessWidget {
  final DateTime dateTime;

  const DateDivider({
    Key? key,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black54.withOpacity(0.15)),
          child: Center(
            child: Text(
              DateFormat.MMMMd('ru_RU').format(dateTime),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
