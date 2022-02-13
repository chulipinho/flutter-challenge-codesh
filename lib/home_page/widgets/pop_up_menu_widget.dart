import 'package:flutter/material.dart';
import 'package:flutter_challenge/edit_product_page/edit_product_page.dart';
import 'package:flutter_challenge/home_page/home_page_controller.dart';
import 'package:flutter_challenge/shared/models/item_model.dart';
import 'package:provider/provider.dart';

class PopUpMenuWidget extends StatelessWidget {
  final ItemModel item;
  const PopUpMenuWidget({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomePageController>(context);

    return Row(
      children: [
        IconButton(
            onPressed: () {
              controller.removeItem(item);
            },
            icon: Icon(Icons.close)),
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProductPage(item: item)));
            },
            icon: Icon(Icons.edit))
      ],
    );
  }
}
