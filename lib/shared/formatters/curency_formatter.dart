import 'dart:html';

import 'package:flutter/services.dart';

class CurencyFormatter extends TextInputFormatter {
  final String decimalSeparator = ',';
  final String thousandSeparator = '.';

  final String sampleValue = 'x,xx';

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length < sampleValue.length) {
      if (newValue.text.isEmpty){
        return TextEditingValue(
          text: '0,00',
          selection: TextSelection.collapsed(offset: newValue.selection.end + 1),
        );
      }
      if (newValue.text.length == 1){
        return TextEditingValue(
          text: '0,0${newValue.text}',
          selection: TextSelection.collapsed(offset: newValue.selection.end + 1),
        );
      }
      if (newValue.text.length == 2){
        return TextEditingValue(
          text: '0,${newValue.text}',
          selection: TextSelection.collapsed(offset: newValue.selection.end + 1),
        );
      }
      if (newValue.text.length > ) 
    }

    return oldValue;
  }



}