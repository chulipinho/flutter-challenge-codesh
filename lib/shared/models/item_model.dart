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
  String title;
  String type;
  String description;
  String filename;
  double? height;
  double? width;
  double price;
  int rating;
  String key;

  ItemModel(
      {required this.title,
      required this.type,
      required this.description,
      required this.filename,
      this.height,
      this.width,
      required this.price,
      required this.rating,
      required this.key})
      : assert(ItemType.values.contains(type.typeParse));

  factory ItemModel.fromDB(Map<String, dynamic> data, key) {
    return ItemModel(
        title: data['title'],
        type: data['type'],
        description: data['description'],
        filename: data['filename'],
        price: data['price'],
        rating: data['rating'],
        key: key.toString());
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'type': type,
      'description': description,
      'filename': filename,
      'price': price,
      'rating': rating
    };
  }
}
