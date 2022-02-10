import 'package:flutter/material.dart';
import 'package:flutter_challenge/home_page/home_page_controller.dart';
import 'package:provider/provider.dart';

class EditItemWidget extends StatelessWidget {
  const EditItemWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomePageController>(context);

    return AlertDialog(
      title: Text("Editar item"),
      content: Column(children: [
        // TextFieldWidget(errorText: errorText, onChanged: onChanged, label: label)
      ],),
    );
  }
}