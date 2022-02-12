import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_challenge/shared/models/item_model.dart';

class HomeRepository {
  Future<List<ItemModel>> getItems() async {
    final response = await rootBundle.loadString("assets/products.json");
    final list = jsonDecode(response) as List;
    final items = list.map((e) => ItemModel.fromMap(e)).toList();
    return items;
  }
}