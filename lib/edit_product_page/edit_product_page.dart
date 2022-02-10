import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/edit_product_page/item_controller/item_controller.dart';
import 'package:flutter_challenge/edit_product_page/widgets/dropdown_type_selector.dart';
import 'package:flutter_challenge/edit_product_page/widgets/text_field_widget.dart';
import 'package:flutter_challenge/models/item_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class EditProductPage extends StatelessWidget {
  final item;
  const EditProductPage({required this.item, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ItemController(item: item);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Observer(builder: (_) => TextFieldWidget(initialValue: controller.title, errorText: null, onChanged: controller.changeTitle, label: 'nome')),
            SizedBox(height: 10,),
            DropdownTypeSelectorWidget(type: controller.type.typeParse),
            SizedBox(height: 10,),
            Observer(builder: (_) => TextFieldWidget(initialValue: controller.title, errorText: null, onChanged: controller.changeTitle, label: 'nome')),
            SizedBox(height: 10,),
            Observer(builder: (_) => TextFieldWidget(initialValue: controller.title, errorText: null, onChanged: controller.changeTitle, label: 'nome')),
          ]),
        ),
      ),
    );
  }
}