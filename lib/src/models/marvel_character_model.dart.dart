import 'package:strat_plus_exam/src/models/section_info_model.dart';
import 'package:strat_plus_exam/src/models/thumbnail_model.dart';
import 'package:strat_plus_exam/src/models/url_model.dart';

class MarvelCharacter {
  int id;
  String name;
  String description;
  String modified;
  Thumbnail thumbnail;
  String resourceUri;
  SectionInfo comics;
  SectionInfo series;
  SectionInfo stories;
  SectionInfo events;
  List<Url> urls;

  MarvelCharacter({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceUri,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
    required this.urls,
  });

  factory MarvelCharacter.fromMap(Map<String, dynamic> map) {
    try {
      List<Url> urls = (map["urls"] as List<dynamic>).map((e) {
        Map<String, dynamic> data = e as Map<String, dynamic>;
        return Url.fromMap(data);
      }).toList();
      return MarvelCharacter(
        id: map["id"],
        name: map["name"],
        description: map["description"],
        modified: map["modified"],
        thumbnail: Thumbnail.fromMap(map["thumbnail"]),
        resourceUri: map["resourceURI"],
        comics: SectionInfo.fromMap(map["comics"]),
        series: SectionInfo.fromMap(map["series"]),
        stories: SectionInfo.fromMap(map["stories"]),
        events: SectionInfo.fromMap(map["events"]),
        urls: urls,
      );
    } catch (e) {
      throw Exception("Error MarvelCharacter.fromMap $e");
    }
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "modified": modified,
      "thumbnail": thumbnail.toMap(),
      "resourceURI": resourceUri,
      "comics": comics.toMap(),
      "series": series.toMap(),
      "stories": stories.toMap(),
      "events": events.toMap(),
      "urls": urls.map((e) => e.toMap()).toList()
    };
  }
}
