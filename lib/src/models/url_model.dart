class Url {
  UrlType type;
  String url;

  Url({
    required this.type,
    required this.url,
  });

  factory Url.fromMap(Map<String, dynamic> map) {
    try {
      UrlType urlType = UrlType.values.firstWhere(
        (e) => e.toString() == "UrlType.${map["type"]}",
        orElse: () => throw StateError('Invalid UrlType: ${map["type"]}'),
      );
      return Url(
        type: urlType,
        url: map["url"],
      );
    } catch (e) {
      throw Exception("Error Url.fromMap $e");
    }
  }

  Map<String, dynamic> toMap() {
      return {
        "type": type.name,
        "url": url,
      };
  }
}

enum UrlType { comiclink, detail, wiki }
