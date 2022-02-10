import 'dart:convert';

enum ItemType { dairy, fruit, vegetable, bakery, vegan, meat }

extension TypeExt on ItemType {
  String get parse => {
        ItemType.dairy: "dairy",
        ItemType.fruit: "fruit",
        ItemType.vegetable: "vegetable",
        ItemType.bakery: "bakery",
        ItemType.vegan: "vegan",
        ItemType.meat: "meat",
      }[this]!;
}

extension TypeStringExt on String {
  ItemType get typeParse => {
        "dairy": ItemType.dairy,
        "fruit": ItemType.fruit,
        "vegetable": ItemType.vegetable,
        "bakery": ItemType.bakery,
        "vegan": ItemType.vegan,
        "meat": ItemType.meat,
      }[this]!;
}

class ItemModel {
  final String title;
  final String type;
  final String desctiption;
  final String filename;
  final double? height;
  final double? width;
  final double price;
  final int rating;

  ItemModel(
      {required this.title,
      required this.type,
      required this.desctiption,
      required this.filename,
      this.height,
      this.width,
      required this.price,
      required this.rating})
      : assert(ItemType.values.contains(type.typeParse));

      

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type,
      'desctiption': desctiption,
      'filename': filename,
      'height': height,
      'width': width,
      'price': price,
      'rating': rating,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      title: map['title'] ?? '',
      type: map['type'] ?? '',
      desctiption: map['desctiption'] ?? '',
      filename: map['filename'] ?? '',
      height: map['height']?.toDouble(),
      width: map['width']?.toDouble(),
      price: map['price']?.toDouble() ?? 0.0,
      rating: map['rating']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source));
} 
