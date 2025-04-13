import 'package:flutter/material.dart';
import 'package:ticket_scanner/util/app_colors.dart';

class LoadingIcon extends StatelessWidget {
  final double size;
  const LoadingIcon({this.size = 24, super.key});

  factory LoadingIcon.extraSmall() {
    return const LoadingIcon(size: 18);
  }

  factory LoadingIcon.medium() {
    return const LoadingIcon(size: 32);
  }

  factory LoadingIcon.large() {
    return const LoadingIcon(size: 44);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(2.0),
      child: const CircularProgressIndicator(
        color: AppColors.pinkPrimary,
        strokeWidth: 3,
      ),
    );
  }
}
