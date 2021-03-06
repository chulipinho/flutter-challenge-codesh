import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/app_colors.dart';
import 'package:flutter_challenge/core/app_text_styles.dart';
import 'package:flutter_challenge/edit_product_page/edit_product_page.dart';
import 'package:flutter_challenge/home_page/controller/home_page_controller.dart';
import 'package:flutter_challenge/home_page/widgets/rating_widget.dart';
import 'package:flutter_challenge/shared/extensions/string_capitalize.dart';
import 'package:flutter_challenge/shared/formatters/curency_formatter.dart';
import 'package:flutter_challenge/shared/models/item_model.dart';
import 'package:flutter_challenge/shared/warnings/warning_widget.dart';
import 'package:intl/intl.dart';
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
    final created = DateTime.fromMillisecondsSinceEpoch(widget.item.created);
    final createdDate = DateFormat.yMMMd().add_jm().format(created);

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
                        Flexible(
                          child: Text(
                            widget.item.title,
                            style: AppTextStyles.itemTitle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(widget.item.type.capitalize()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RatingWidget(rating: widget.item.rating),
                            Text(
                              'Created: $createdDate',
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        )
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
                            padding: EdgeInsets.only(right: 12),
                            constraints: BoxConstraints(),
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text('Warning'),
                                  content: Text.rich(
                                    TextSpan(
                                      text: 'Do you really wish to remove ',
                                      children: [
                                        TextSpan(
                                            text: widget.item.title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: '?'),
                                        TextSpan(
                                            text:
                                                '\nThis action cannot be undone',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                height: 2))
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        try {
                                          controller.removeItem(widget.item);
                                          Navigator.pop(context);
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  WarningWidget.success(
                                                      'The item ${widget.item.title} was removed successfully.'));
                                        } catch (e) {
                                          showDialog<String>(
                                                  context: context,
                                                  builder: (context) =>
                                                      WarningWidget.error(
                                                          'Something went wrong'))
                                              .then((value) =>
                                                  Navigator.pop(context));
                                        }
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.close,
                              size: 26,
                            )),
                        IconButton(
                            padding: EdgeInsets.all(0),
                            constraints: BoxConstraints(),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProductPage(
                                          item: widget.item))).then((value) {
                                setState(() {});
                              });
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 24,
                            ))
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
