import 'package:strat_plus_exam/src/models/marvel_character_model.dart.dart';

class MarvelCharactersResponse {
  int offset;
  int limit;
  int total;
  int count;
  List<MarvelCharacter> characters;

  MarvelCharactersResponse({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.characters,
  });

  factory MarvelCharactersResponse.fromMap(Map<String, dynamic> map) {
    try {
      List<MarvelCharacter> characters =
          (map["results"] as List<dynamic>).map((e) {
        Map<String, dynamic> data = e as Map<String, dynamic>;
        return MarvelCharacter.fromMap(data);
      }).toList();
      return MarvelCharactersResponse(
        offset: map["offset"],
        limit: map["limit"],
        total: map["total"],
        count: map["count"],
        characters: characters,
      );
    } catch (e) {
      throw Exception("Error MarvelCharactersResponse.fromMap $e");
    }
  }

  Map<String, dynamic> toMap() {
    return {
      "offset": offset,
      "limit": limit,
      "total": total,
      "count": count,
      "results": characters.map((e) => e.toMap()).toList()
    };
  }
}
