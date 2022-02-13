import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/app_colors.dart';
import 'package:flutter_challenge/edit_product_page/edit_product_page.dart';
import 'package:flutter_challenge/home_page/home_page_controller.dart';
import 'package:flutter_challenge/home_page/widgets/pop_up_menu_widget.dart';
import 'package:flutter_challenge/home_page/widgets/rating_widget.dart';
import 'package:flutter_challenge/shared/formatters/curency_formatter.dart';
import 'package:flutter_challenge/shared/models/item_model.dart';
import 'package:provider/provider.dart';

class ItemWidget extends StatefulWidget {
  final ItemModel item;
  const ItemWidget({required this.item, Key? key}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomePageController>(context);
    const double defaultHeight = 100;
    final price = CurencyFormatter.formatDouble(widget.item.price);

    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: defaultHeight,
                width: defaultHeight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/${widget.item.filename}'),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                    height: defaultHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.item.title),
                        Text(widget.item.type),
                        RatingWidget(rating: widget.item.rating),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: defaultHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.removeItem(widget.item);
                            },
                            icon: Icon(Icons.close)),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditProductPage(item: widget.item))).then((value) {
                                            setState(() {
                                              
                                            });
                                          });
                            },
                            icon: Icon(Icons.edit))
                      ],
                    ),
                    Text('\$ $price'),
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
