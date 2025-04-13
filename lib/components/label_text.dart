import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String label;
  final String text;
  final TextStyle? textStyle;
  final TextStyle? textStyle2;
  final MainAxisAlignment? mainAxisAlignment;

  const LabelText(
      {super.key,
      required this.label,
      required this.text,
      this.textStyle,
      this.textStyle2,
      this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: textStyle ?? const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: textStyle2,
        )
      ],
    );
  }

  static List<Widget> fill(Map<String, String> data, {TextStyle? textStyle}) {
    List<Widget> lbs = [];
    data.forEach((key, value) {
      lbs.add(Padding(
        padding: const EdgeInsets.all(3.0),
        child: LabelText(
          label: key,
          text: value,
          textStyle: textStyle,
        ),
      ));
    });
    return lbs;
  }
}
