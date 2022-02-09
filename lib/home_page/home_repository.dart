import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_challenge/models/item_model.dart';

class HomeRepository {
  Future<List<ItemModel>> getItems() async {
    final response = await rootBundle.loadString("products.json");
    final list = jsonDecode(response) as List;
    final items = list.map((e) => ItemModel.fromJson(e)).toList();
    return items;
  }
}