import 'package:flutter/material.dart';

class OutlinedDropdownButton<T> extends StatelessWidget {
  final T? value;
  final String? hint;
  final List<DropdownMenuItem<T>>? items;
  final Function(T value)? onChanged;
  const OutlinedDropdownButton({
    this.value,
    this.items,
    this.onChanged,
    this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: DropdownButton<T>(
          style: Theme.of(context).textTheme.bodyMedium,
          value: value,
          hint: hint == null ? null : Text(hint!),
          isExpanded: true,
          items: items,
          onChanged: (e) {
            if (e != null && onChanged != null) {
              onChanged!(e);
            }
          }),
    );
  }
}
