import 'package:flutter_challenge/models/item_model.dart';
import 'package:mobx/mobx.dart';

part 'item_controller.g.dart';

class ItemController = _ItemController with _$ItemController;

abstract class _ItemController with Store {
  // todo: add img field
  final ItemModel item;

  @observable
  String title;
  @action
  void changeTitle(value) => title = value;

  @observable
  String type;
  @action
  void changeType(value) => type = value;

  @observable
  int rating;
  @action
  void changeRating(value) => rating = value;

  @observable
  double price;
  @action
  void changePrice(value) => price = value;

  _ItemController({required this.item})
      : title = item.title,
        type = item.type,
        rating = item.rating,
        price = item.price;
}
