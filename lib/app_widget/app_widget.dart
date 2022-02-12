import 'package:flutter/material.dart';
import 'package:flutter_challenge/edit_product_page/edit_product_page.dart';
import 'package:flutter_challenge/home_page/home_page_controller.dart';
import 'package:flutter_challenge/shared/models/item_model.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<HomePageController>(
      create: (_) => HomePageController(),
      child: MaterialApp(
        home: EditProductPage(item: ItemModel(title: 'title', type: 'dairy', desctiption: 'desctiption', filename: '1.jpg', price: 2, rating: 2),),
      ),
    );
  }
}
