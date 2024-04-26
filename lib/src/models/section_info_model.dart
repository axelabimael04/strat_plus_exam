import 'package:strat_plus_exam/src/models/item_model.dart';

class SectionInfo {
  int available;
  String collectionUri;
  List<Item> items;
  int returned;

  SectionInfo({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory SectionInfo.fromMap(Map<String, dynamic> map) {
    try {
      List<Item> items = (map["items"] as List<dynamic>).map((e) {
        Map<String, dynamic> data = e as Map<String, dynamic>;
        return Item.fromMap(data);
      }).toList();
      return SectionInfo(
        available: map["available"],
        collectionUri: map["collectionURI"],
        items: items,
        returned: map["returned"],
      );
    } catch (e) {
      throw Exception("Error SectionInfo.fromMap $e");
    }
  }

  Map<String, dynamic> toMap() {
    return {
      "available": available,
      "collectionURI": collectionUri,
      "items": items.map((e) => e.toMap()).toList(),
      "returned": returned,
    };
  }
}
