import 'package:flutter/material.dart';
import 'package:ticket_scanner/util/app_colors.dart';

class OutlinedTextField extends StatelessWidget {
  // final FocusNode _focusNode = FocusNode();
  final Function(String value)? onChanged;
  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final String? initialValue;
  final IconData? prefixIcon;
  final int? maxLines;
  const OutlinedTextField({
    this.onChanged,
    this.labelText,
    this.controller,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.initialValue,
    this.prefixIcon,
    this.maxLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // focusNode: _focusNode,
      decoration: InputDecoration(
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
        prefixIconColor: AppColors.pinkPrimary,
        labelText: labelText,
        alignLabelWithHint: true,
        labelStyle: TextStyle(color: Colors.grey[600]),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.pinkPrimary),
        ),
      ),
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      onSaved: onSaved,
      initialValue: initialValue,
      maxLines: maxLines,
    );
  }
}
