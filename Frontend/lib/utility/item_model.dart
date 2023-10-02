import 'dart:convert';

List<Item> itemsFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemsToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  String itemName;
  String assetName;
  int itemPrice;
  String description;

  Item(
      {required this.itemName,
      required this.itemPrice,
      required this.assetName,
      required this.description});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemName: json["item_name"],
        itemPrice: json["item_price"],
        assetName: json["file_name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "item_name": itemName,
        "item_price": itemPrice,
        "file_name": description,
      };
}
