import 'package:flutter/cupertino.dart';
import 'package:flutter_challenge/home_page/home_repository.dart';
import 'package:flutter_challenge/models/item_model.dart';
import 'package:mobx/mobx.dart';

part 'home_page_controller.g.dart';

enum HomeState {loading, error, loaded, empty}

class HomePageController = _HomePageController with _$HomePageController;

abstract class _HomePageController with Store {
  final repository = HomeRepository();
  final stateNotifier = ValueNotifier(HomeState.empty);
  
  set state(value) => stateNotifier.value = value;
  HomeState get state => stateNotifier.value;

  @observable
  ObservableList<ItemModel>? items;  

  void load() async{
    state = HomeState.loading;
    final list = await repository.getItems();
    items = ObservableList<ItemModel>.of(list).asObservable();
    state = HomeState.loaded;
  }

  @action
  void addItem(ItemModel item) {
    items!.add(item);
  }
}