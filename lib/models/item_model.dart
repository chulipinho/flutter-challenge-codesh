import 'dart:convert';

enum ItemTypes { dairy, fruit, vegetable, bakery, vegan, meat }

extension TypeExt on ItemTypes {
  String get parse => {
        ItemTypes.dairy: "dairy",
        ItemTypes.fruit: "fruit",
        ItemTypes.vegetable: "vegetable",
        ItemTypes.bakery: "bakery",
        ItemTypes.vegan: "vegan",
        ItemTypes.meat: "meat",
      }[this]!;
}

extension TypeStringExt on String {
  ItemTypes get typeParse => {
        "dairy": ItemTypes.dairy,
        "fruit": ItemTypes.fruit,
        "vegetable": ItemTypes.vegetable,
        "bakery": ItemTypes.bakery,
        "vegan": ItemTypes.vegan,
        "meat": ItemTypes.meat,
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
      : assert(ItemTypes.values.contains(type.typeParse));

      

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
