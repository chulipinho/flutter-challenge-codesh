// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageController on _HomePageController, Store {
  final _$stateAtom = Atom(name: '_HomePageController.state');

  @override
  HomeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$itemsAtom = Atom(name: '_HomePageController.items');

  @override
  ObservableList<ItemModel>? get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<ItemModel>? value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$_HomePageControllerActionController =
      ActionController(name: '_HomePageController');

  @override
  void addItem(ItemModel item) {
    final _$actionInfo = _$_HomePageControllerActionController.startAction(
        name: '_HomePageController.addItem');
    try {
      return super.addItem(item);
    } finally {
      _$_HomePageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(ItemModel item) {
    final _$actionInfo = _$_HomePageControllerActionController.startAction(
        name: '_HomePageController.removeItem');
    try {
      return super.removeItem(item);
    } finally {
      _$_HomePageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
items: ${items}
    ''';
  }
}
