import 'package:flutter/material.dart';
import 'package:flutter_challenge/home_page/home_page_controller.dart';
import 'package:flutter_challenge/home_page/widgets/item_widget.dart';
import 'package:flutter_challenge/shared/models/item_model.dart';
import 'package:flutter_challenge/shared/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  final Stream<List<ItemModel>> items;
  const ItemList({required this.items, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomePageController>(context);


    return StreamBuilder(
      stream: controller.items,
      builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return LoadingWidget(message: 'Failed connecting to database.\nPlease check your network connection or try again later.',);
      }
      
      final list = List.from(snapshot.data as dynamic);

      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, index) {
          var item = list[index];
          return ItemWidget(
            item: item,
          );
        },
      );
    });
  }
}
