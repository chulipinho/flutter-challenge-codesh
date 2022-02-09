import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/app_colors.dart';
import 'package:flutter_challenge/home_page/widgets/rating_widget.dart';

import '../../models/item_model.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel item;
  const ItemWidget({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double defaultHeight = 100;

    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), border: Border.all(color: AppColors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: defaultHeight,
                    width: defaultHeight,
                    decoration: BoxDecoration(color: Colors.green),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      height: defaultHeight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.title),
                          Text(item.type),
                          RatingWidget(rating: item.rating),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: defaultHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("menu"),
                    Text('\$ ${item.price}'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
