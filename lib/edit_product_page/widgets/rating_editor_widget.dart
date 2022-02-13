import 'package:flutter/material.dart';
import 'package:flutter_challenge/core/app_colors.dart';
import 'package:flutter_challenge/edit_product_page/item_controller/item_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RatingEditorWidget extends StatefulWidget {
  final ItemController controller;
  const RatingEditorWidget(this.controller, {Key? key}) : super(key: key);

  @override
  _RatingEditorWidgetState createState() => _RatingEditorWidgetState();
}

class _RatingEditorWidgetState extends State<RatingEditorWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Row(
        children: List.generate(
          5,
          (index) => GestureDetector(
            onTap: () {widget.controller.changeRating(index+1);},
            child: Icon(
              Icons.star_rounded,
              size: 40,
              color: index >= widget.controller.rating ? AppColors.grey : AppColors.purple,
            ),
          ),
        ),
      ),
    );
  }
}
