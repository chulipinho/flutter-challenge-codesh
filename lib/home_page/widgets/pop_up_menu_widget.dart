import 'package:flutter/material.dart';
import 'package:flutter_challenge/home_page/home_page_controller.dart';
import 'package:flutter_challenge/home_page/widgets/edit_item_widget.dart';
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
            child: Text("Edit"),
            onTap: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('AlertDialog Title'),
                    content: const Text('AlertDialog description'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ))
      ],
      child: Icon(Icons.menu),
    );
  }
}
