import 'package:flutter/material.dart';
import 'package:flutter_challenge/home_page/widgets/item_widget.dart';
import 'package:flutter_challenge/shared/models/item_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class ItemList extends StatelessWidget {
  final ObservableList<ItemModel> items;
  const ItemList({required this.items, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (items.isEmpty) {
        return Center(
          child: Text("You haven't added any items to the list yet."),
        );
      }

      return ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
          var item = items[index];
          return ItemWidget(
            item: item,
          );
        },
      );
    });
  }
}
