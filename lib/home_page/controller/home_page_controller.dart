import 'package:flutter_challenge/home_page/repository/home_repository.dart';
import 'package:flutter_challenge/shared/models/item_model.dart';
import 'package:mobx/mobx.dart';

part 'home_page_controller.g.dart';

enum HomeState { loading, error, loaded, empty }

class HomePageController = _HomePageController with _$HomePageController;

abstract class _HomePageController with Store {
  final repository = HomeRepository();

  @observable
  HomeState state = HomeState.empty;

  Stream<List<ItemModel>?>? items;

  void load() {
    state = HomeState.loading;
    items = repository.getItems();
    state = HomeState.loaded;
  }

  void resetDatabase() {
    repository.resetDatabase();
  }

  void removeItem(item) {
    repository.delete(item);
  }
}
