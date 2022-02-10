import 'package:flutter/material.dart';
import 'package:flutter_challenge/home_page/home_page_controller.dart';
import 'package:flutter_challenge/models/item_model.dart';
import 'package:provider/provider.dart';

class PopUpMenuWidget extends StatelessWidget {
  final ItemModel item;
  const PopUpMenuWidget({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomePageController>(context);

    return PopupMenuButton(
      itemBuilder: (_) => [
        PopupMenuItem(
          child: Text("Delete"),
          onTap: () {
            controller.removeItem(item);
          },
        ),
        PopupMenuItem(
          value: 'item',
          child: Text("Edit"),
          onTap: () {},
        )
      ],
      child: Icon(Icons.menu),
    );
  }
}
