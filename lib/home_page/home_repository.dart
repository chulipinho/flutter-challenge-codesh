import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_challenge/shared/models/item_model.dart';

class HomeRepository {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  Stream<List<ItemModel>> getItems() {
    final itemStream = _database.onValue;
    final results = itemStream.map((event) {
      final List itemMap = event.snapshot.value as List;
      final itemList = itemMap.map((e) {
        return ItemModel.fromDB(Map<String, dynamic>.from(e));
      }).toList();
      return itemList;
    });
    return results;
  }

  void push(ItemModel item) {
    _database.push().set(item.toMap());
  }

  void remove(ItemModel item) {
    // todo: treat case for more than one title
    final itemReference = _database.child(item.title);
    itemReference.remove();
  }
}
