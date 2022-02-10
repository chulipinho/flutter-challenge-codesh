// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/item_model.dart';

class DropdownTypeSelectorWidget extends StatefulWidget {
  ItemType type;
  DropdownTypeSelectorWidget({required this.type, Key? key}) : super(key: key);

  @override
  State<DropdownTypeSelectorWidget> createState() =>
      _DropdownTypeSelectorWidgetState();
}

class _DropdownTypeSelectorWidgetState
    extends State<DropdownTypeSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
        decoration: InputDecoration(
            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
            hintText: 'Please select expense',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<ItemType>(
            value: widget.type,
            items: ItemType.values.map((e) {
              return DropdownMenuItem(
                child: Text(e.parse),
                value: e,
              );
            }).toList(),
            onChanged: (newType) {
              setState(() {
                widget.type = newType!;
              });
            },
          ),
        ));
  }
}
