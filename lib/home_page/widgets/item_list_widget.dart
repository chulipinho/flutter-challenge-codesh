import 'package:flutter/material.dart';
import 'package:flutter_challenge/home_page/controller/home_page_controller.dart';
import 'package:flutter_challenge/home_page/widgets/item_widget.dart';
import 'package:flutter_challenge/shared/models/item_model.dart';
import 'package:flutter_challenge/shared/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomePageController>(context);

    return StreamBuilder(
        stream: controller.items,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingWidget(
              message:
                  'Failed connecting to database.\nPlease check your network connection or try again later.',
            );
          }

          final List<ItemModel> list = List.from(snapshot.data as dynamic);
          final List<ItemModel> notDeleted = [];

          for (var element in list) {
            if (!element.isDeleted) notDeleted.add(element);
          }

          if (notDeleted.isEmpty) {
            return Center(
              child: Text(
                'The list is empty.\nPlease add more items to the database or reset it.',
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView.builder(
            itemCount: notDeleted.length,
            itemBuilder: (_, index) {
              final ItemModel item = notDeleted[index];
              return ItemWidget(
                item: item,
              );
            },
          );
        });
  }
}
