import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/shared/models/item_model.dart';

class HomeRepository {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  Stream<List<ItemModel>?> getItems() {
    final itemStream = _database.child('items').onValue;
    final results = itemStream.map((event) {
      if (event.snapshot.value == null) return null;
      final itemMap = Map<dynamic, dynamic>.from(event.snapshot.value as Map);
      final itemList = itemMap.entries.map((e) {
        return ItemModel.fromDB(Map<String, dynamic>.from(e.value), e.key);
      }).toList();
      return itemList;
    });
    return results;
  }

  // void fixDB() async {
  //   final item = await _database.get();
  //   final newItemMap = (item.value as List).map((e) => newItem(e)).toList();
  //   for (var i = 0; i < newItemMap.length; i++) {
  //     _database.child('items').push().set(newItemMap[i]);
  //   }
  // }

  // Map<String, dynamic> newItem(Map item) {
  //   return {
  //     "title": item["title"],
  //     "type": item["type"],
  //     "description": item["description"],
  //     "filename": item["filename"],
  //     "height": item["height"],
  //     "width": item["width"],
  //     "price": item["price"],
  //     "rating": item["rating"],
  //     "lastEdit": DateTime.now().millisecondsSinceEpoch,
  //     "created": DateTime.now().millisecondsSinceEpoch,
  //     "isDeleted": false
  //   };
  // }

  Map<String, dynamic> databaseFromJson(String source) {
    return json.decode(source);
  }

  void resetDatabase() async {
    final json = await rootBundle.loadString('assets/database/database.json');
    final dbFromJson = databaseFromJson(json);
    final items = Map<String, dynamic>.from(dbFromJson['items']);
    final itemsReference = _database.child("items");
    items.forEach(
      (key, value) {
        final itemReference = itemsReference.child(key);
        itemReference.update(value);
        itemReference.update({'isDeleted': false});
      },
    );
  }

  void delete(ItemModel item) {
    final dbReference = _database.child('items').child(item.key);
    dbReference.update({'isDeleted': true});
  }
}
