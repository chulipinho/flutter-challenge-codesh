// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_challenge/shared/formatters/curency_formatter.dart';
import 'package:flutter_challenge/shared/models/item_model.dart';
import 'package:mobx/mobx.dart';

part 'item_controller.g.dart';

class ItemController = _ItemController with _$ItemController;

abstract class _ItemController with Store {
  final ItemModel item;

  String filename;

  @observable
  String title;
  @action
  void changeTitle(value) => title = value;

  @observable
  String description;
  @action
  void changeDescription(value) => description = value;

  @observable
  String type;
  @action
  void changeType(value) => type = value;

  @observable
  int rating;
  @action
  void changeRating(value) => rating = value;

  @observable
  String price;
  @action
  void changePrice(value) => price = value;

  _ItemController(this.item)
      : title = item.title,
        type = item.type,
        rating = item.rating,
        price = CurencyFormatter.formatDouble(item.price),
        filename = item.filename,
        description = item.description;

  String? validateName() {
    if (title == '' || title == null) return 'Please insert a name';
    return null;
  }

  String? validatePrice() {
    if (price == '' || price == null) return 'Please insert a price';
    return null;
  }

  @computed
  bool get isFormValid => validateName() == null && validatePrice() == null;

  void submitForm() {
    final dbReference = FirebaseDatabase.instance.ref().child(item.key);
    dbReference.update({
      'description': description,
      'price': CurencyFormatter.doubleParse(price),
      'title': title,
      'type': type,
      'rating': rating
    });
  }
}
