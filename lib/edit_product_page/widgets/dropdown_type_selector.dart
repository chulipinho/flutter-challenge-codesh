// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_challenge/shared/extensions/string_capitalize.dart';
import 'package:flutter_challenge/shared/models/item_model.dart';

class DropdownTypeSelectorWidget extends StatefulWidget {
  final void Function(dynamic) onChange;
  ItemType type;
  DropdownTypeSelectorWidget(
      {required this.type, required this.onChange, Key? key})
      : super(key: key);

  @override
  State<DropdownTypeSelectorWidget> createState() =>
      _DropdownTypeSelectorWidgetState();
}

class _DropdownTypeSelectorWidgetState
    extends State<DropdownTypeSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: InputDecorator(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ItemType>(
              isExpanded: true,
              value: widget.type,
              items: ItemType.values.map((e) {
                return DropdownMenuItem(
                  child: Text(e.parse.capitalize()),
                  value: e,
                );
              }).toList(),
              onChanged: (newType) {
                widget.onChange(newType);
                setState(() {
                  widget.type = newType!;
                });
              },
            ),
          )),
    );
  }
}
