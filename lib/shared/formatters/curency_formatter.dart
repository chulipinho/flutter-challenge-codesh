import 'dart:html';

import 'package:flutter/services.dart';

class CurencyFormatter extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final value;
    if (newValue.text.isEmpty) value = 0;
    else value = newValue.text;

    return TextEditingValue(text: formatedValue(intValue(value)));
  }

  int intValue(String value) {
    return int.parse(value.replaceAll(RegExp(r'[^0-9]')));
  }
  
  String formatedValue(int value){
    String decimal = (value % 100).toString();
    if (decimal.length < 2) decimal = '0' + decimal;
    value = (value / 100).toInt();

    String strValue = value.toString();
    String reversed = strValue.reverse();
    String grouped = reversed.replaceAllMapped(RegExp(r".{3}"), (match) => "${match.group(0)} ").trim();
    String dotted = grouped.replaceAll(RegExp(r' '), '.');
    String integer = dotted.reverse();

    return '$integer,$decimal';
  }


  extension Reverse on String {
    String reverse() {
      var reversed = '';
      for (var i = 0; i < this.length; i++){
        reversed += this[this.length - i - 1];
      }
      return reversed;
    }
  }
}

