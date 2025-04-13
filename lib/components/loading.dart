import 'package:flutter/material.dart';
import 'package:ticket_scanner/util/app_colors.dart';

class Loading extends StatelessWidget {
  final double height;
  final String message;
  const Loading({
    this.height = double.maxFinite,
    this.message = 'Loading...',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.pinkPrimary,
              strokeWidth: 4,
            ),
            const SizedBox(height: 15),
            Text(message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
