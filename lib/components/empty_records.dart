import 'package:flutter/material.dart';
import 'package:ticket_scanner/util/app_colors.dart';

class EmptyRecords extends StatelessWidget {
  final String? message;
  const EmptyRecords({this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          Icons.hourglass_empty_outlined,
          size: 50,
          color: AppColors.pinkPrimary.shade200,
        ),
        const SizedBox(height: 15),
        Text(
          message ?? 'No records found',
          style: const TextStyle(color: Colors.grey, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
