import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String initialValue;
  final void Function(String) onChanged;
  final String? Function()? errorText;
  final int maxLines;
  const TextFieldWidget({this.maxLines = 1, required this.initialValue, this.errorText, required this.onChanged, required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      maxLines: maxLines,
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        errorText: errorText == null ? null : errorText!(),
      ),
    );
  }
}
