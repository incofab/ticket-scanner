import 'package:flutter/material.dart';
import 'package:ticket_scanner/util/app_colors.dart';

class BrandOutlinedButton extends StatelessWidget {
  final bool isLoading;
  final Function()? onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size? size;
  const BrandOutlinedButton({
    this.label = 'Submit',
    this.isLoading = false,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor ?? AppColors.pinkPrimary,
        fixedSize: size,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: foregroundColor ?? AppColors.pinkPrimary,
            ),
          ),
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
              : [])
        ],
      ),
    );
  }
}
