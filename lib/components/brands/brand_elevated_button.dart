import 'package:flutter/material.dart';
import 'package:ticket_scanner/util/app_colors.dart';

class BrandElevatedButton extends StatelessWidget {
  final bool isLoading;
  final Function()? onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? icon;
  final Size? size;
  const BrandElevatedButton({
    this.label = 'Submit',
    this.isLoading = false,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
    this.size,
    super.key,
  });

  factory BrandElevatedButton.accent({
    String label = 'Submit',
    bool isLoading = false,
    Function()? onPressed,
    IconData? icon,
    Size? size,
  }) {
    return BrandElevatedButton(
      label: label,
      isLoading: isLoading,
      onPressed: onPressed,
      icon: icon,
      size: size,
      backgroundColor: AppColors.pinkPrimary,
    );
  }

  factory BrandElevatedButton.dark({
    String label = 'Submit',
    bool isLoading = false,
    Function()? onPressed,
    IconData? icon,
  }) {
    return BrandElevatedButton(
      label: label,
      isLoading: isLoading,
      onPressed: onPressed,
      backgroundColor: Colors.grey.shade400,
      foregroundColor: Colors.black,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          backgroundColor: backgroundColor ?? AppColors.pinkPrimary,
          foregroundColor: foregroundColor ?? Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          fixedSize: size),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...(isLoading
              ? [
                  Container(
                    width: 24,
                    height: 24,
                    padding: const EdgeInsets.all(2.0),
                    child: CircularProgressIndicator(
                      color: foregroundColor ?? Colors.white,
                      strokeWidth: 3,
                    ),
                  ),
                  const SizedBox(width: 10),
                ]
              : icon == null
                  ? []
                  : [
                      Icon(icon, color: foregroundColor ?? Colors.white),
                      const SizedBox(width: 10),
                    ]),
          Text(label),
        ],
      ),
    );
  }
}
