
class Item {
  String resourceUri;
  String name;

  Item({
    required this.resourceUri,
    required this.name,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    try {
      return Item(
        resourceUri: map["resourceURI"],
        name: map["name"],
      );
    } catch (e) {
      throw Exception("Error Item.fromMap $e");
    }
  }

  Map<String, dynamic> toMap() {
    return {
      "resourceURI": resourceUri,
      "name": name,
    };
  }
}

enum ItemType { cover, empty, interiorStory }
