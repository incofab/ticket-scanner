import 'package:flutter/material.dart';
import 'package:ticket_scanner/util/app_colors.dart';

class BrandTextButton extends StatelessWidget {
  final bool isLoading;
  final Function()? onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? icon;

  const BrandTextButton({
    this.label = 'Submit',
    this.isLoading = false,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
    super.key,
  });

  factory BrandTextButton.accent({
    String label = 'Submit',
    bool isLoading = false,
    Function()? onPressed,
    IconData? icon,
  }) {
    return BrandTextButton(
      label: label,
      isLoading: isLoading,
      onPressed: onPressed,
      foregroundColor: AppColors.pinkPrimary,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        foregroundColor: foregroundColor ?? AppColors.pinkPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 5),
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
                  )
                ]
              : (icon == null
                  ? [
                      Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          icon,
                          color: foregroundColor ?? Colors.white,
                        ),
                      )
                    ]
                  : [])),
          Text(label, style: TextStyle(color: foregroundColor)),
        ],
      ),
    );
  }
}
