import 'package:flutter/material.dart';
import 'package:flutter_challenge/home_page/widgets/item_widget.dart';

import '../../models/item_model.dart';

class ItemList extends StatelessWidget {
  final List<ItemModel>? items;
  const ItemList({ this.items, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [ItemWidget(), ItemWidget()],);
  }
}