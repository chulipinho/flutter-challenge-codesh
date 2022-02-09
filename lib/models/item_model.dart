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
  final String image;
  final double? height;
  final double? width;
  final double price;
  final int rating;

  ItemModel(
      {required this.title,
      required this.type,
      required this.desctiption,
      required this.image,
      this.height,
      this.width,
      required this.price,
      required this.rating})
      : assert(ItemTypes.values.contains(type.typeParse));
} 
