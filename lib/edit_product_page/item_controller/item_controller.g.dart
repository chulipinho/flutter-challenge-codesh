// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemController on _ItemController, Store {
  final _$titleAtom = Atom(name: '_ItemController.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$typeAtom = Atom(name: '_ItemController.type');

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$ratingAtom = Atom(name: '_ItemController.rating');

  @override
  int get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(int value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  final _$priceAtom = Atom(name: '_ItemController.price');

  @override
  double get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$_ItemControllerActionController =
      ActionController(name: '_ItemController');

  @override
  void changeTitle(dynamic value) {
    final _$actionInfo = _$_ItemControllerActionController.startAction(
        name: '_ItemController.changeTitle');
    try {
      return super.changeTitle(value);
    } finally {
      _$_ItemControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeType(dynamic value) {
    final _$actionInfo = _$_ItemControllerActionController.startAction(
        name: '_ItemController.changeType');
    try {
      return super.changeType(value);
    } finally {
      _$_ItemControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeRating(dynamic value) {
    final _$actionInfo = _$_ItemControllerActionController.startAction(
        name: '_ItemController.changeRating');
    try {
      return super.changeRating(value);
    } finally {
      _$_ItemControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePrice(dynamic value) {
    final _$actionInfo = _$_ItemControllerActionController.startAction(
        name: '_ItemController.changePrice');
    try {
      return super.changePrice(value);
    } finally {
      _$_ItemControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
type: ${type},
rating: ${rating},
price: ${price}
    ''';
  }
}
