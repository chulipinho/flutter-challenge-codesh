import 'dart:core';

import 'package:flutter/services.dart';

class CurencyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String value;
    if (newValue.text.isEmpty) {
      value = '0';
    } else {
      value = newValue.text;
    }
    final String result = formatInt(intValue(value));
    return TextEditingValue(
        text: result,
        selection:
            TextSelection.fromPosition(TextPosition(offset: result.length)));
  }

  int intValue(String value) {
    return int.parse(value.replaceAll(RegExp(r'[^0-9]'), ''));
  }

  static String formatInt(int value) {
    String decimal = (value % 100).toString();
    if (decimal.length < 2) decimal = '0' + decimal;
    value = value ~/ 100;

    String integer = value.toString();

    integer = separateThousands(integer);

    return '$integer,$decimal';
  }

  static String formatDouble(value) {
    if (value is !String) value = value.toString();
    final List<String> values = value.split('.');

    String integer = values[0];
    String decimal = values[1];
    if (decimal.length < 2) decimal = '0' + decimal;
    
    integer = separateThousands(integer);

    return '$integer,$decimal';
  }

  static double doubleParse(String value) {
    value = value.replaceAll('.', '');
    value = value.replaceAll(',', '.');

    return double.parse(value);
  }

  static String separateThousands(String value) {
    String reversed = value.reverse();
    String grouped = reversed
        .replaceAllMapped(RegExp(r".{3}"), (match) => "${match.group(0)} ")
        .trim();
    String dotted = grouped.replaceAll(RegExp(r' '), '.');

    return dotted.reverse();
  }
}

extension TypeStringExt on String {
  String reverse() {
    var reversed = '';
    for (var i = 0; i < length; i++) {
      reversed += this[length - i - 1];
    }
    return reversed;
  }
}
