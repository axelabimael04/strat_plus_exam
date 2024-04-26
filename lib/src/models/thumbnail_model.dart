class Thumbnail {
  String path;
  Extension extension;

  Thumbnail({
    required this.path,
    required this.extension,
  });

  factory Thumbnail.fromMap(Map<String, dynamic> map) {
    try {
      Extension extensionMedia = Extension.values.firstWhere(
        (e) => e.toString() == "Extension.${map["extension"]}",
        orElse: () =>
            throw StateError('Invalid Extension: ${map["extension"]}'),
      );
      return Thumbnail(
        path: map["path"],
        extension: extensionMedia,
      );
    } catch (e) {
      throw Exception("Error Thumbnail.fromMap $e");
    }
  }

  Map<String, dynamic> toMap() {
    return {
      "path": path,
      "extension": extension.name,
    };
  }
}

enum Extension { gif, jpg }
