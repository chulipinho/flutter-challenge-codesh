import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final void Function(String) onChanged;
  final String Function() errorText;
  const TextFieldWidget({required this.errorText, required this.onChanged, required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }
}
