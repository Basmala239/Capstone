import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  final String title;
  final List<String> options;
  final List<String> selectedOptions;
  final Function(String, bool) onOptionChanged;

  const FilterSection({
    super.key,
    required this.title,
    required this.options,
    required this.selectedOptions,
    required this.onOptionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        ...options.map((option) => CheckboxListTile(
              title: Text(option),
              value: selectedOptions.contains(option),
              onChanged: (bool? value) {
                onOptionChanged(option, value ?? false);
              },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            )),
      ],
    );
  }
}
