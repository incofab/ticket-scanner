import 'package:flutter/material.dart';
import 'package:ticket_scanner/components/brands/brand_elevated_button.dart';
import 'package:ticket_scanner/util/app_colors.dart';

class MessageDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function() positiveAction;
  final String? positiveActionTitle;
  final Function()? negativeAction;
  final String? negativeActionTitle;
  final Widget? body;
  const MessageDialog(
    this.title,
    this.message,
    this.positiveAction, {
    this.positiveActionTitle,
    this.negativeAction,
    this.negativeActionTitle,
    this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      backgroundColor: AppColors.pinkPrimary.shade50,
      content: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400.0, // Set the maximum width here
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: body ?? Text(message),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            ...(negativeAction == null
                ? []
                : [
                    BrandElevatedButton.accent(
                      label: negativeActionTitle ?? 'Cancel',
                      onPressed: () {
                        Navigator.pop(context, false);
                        negativeAction!();
                      },
                    ),
                    const SizedBox(width: 10)
                  ]),
            BrandElevatedButton(
              label: positiveActionTitle ?? 'Ok',
              onPressed: () {
                Navigator.of(context).pop(true);
                positiveAction();
              },
            ),
          ],
        ),
      ],
    );
  }
}
