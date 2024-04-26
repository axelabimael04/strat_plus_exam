import 'package:flutter_test/flutter_test.dart';
import 'package:strat_plus_exam/src/models/marvel_character_model.dart.dart';
import 'package:strat_plus_exam/src/models/section_info_model.dart';
import 'package:strat_plus_exam/src/models/thumbnail_model.dart';

void main() {
  Map<String, dynamic> map = {
    "id": 1011334,
    "name": "3-D Man",
    "description": "",
    "modified": "2014-04-29T14:18:17-0400",
    "thumbnail": {
      "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
      "extension": "jpg"
    },
    "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011334",
    "comics": {
      "available": 12,
      "collectionURI":
          "http://gateway.marvel.com/v1/public/characters/1011334/comics",
      "items": [
        {
          "resourceURI": "http://gateway.marvel.com/v1/public/comics/21366",
          "name": "Avengers: The Initiative (2007) #14"
        }
      ],
      "returned": 12
    },
    "series": {
      "available": 3,
      "collectionURI":
          "http://gateway.marvel.com/v1/public/characters/1011334/series",
      "items": [
        {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/1945",
          "name": "Avengers: The Initiative (2007 - 2010)"
        }
      ],
      "returned": 3
    },
    "stories": {
      "available": 21,
      "collectionURI":
          "http://gateway.marvel.com/v1/public/characters/1011334/stories",
      "items": [
        {
          "resourceURI": "http://gateway.marvel.com/v1/public/stories/19947",
          "name": "Cover #19947",
          "type": "cover"
        }
      ],
      "returned": 20,
    },
    "events": {
      "available": 1,
      "collectionURI":
          "http://gateway.marvel.com/v1/public/characters/1011334/events",
      "items": [
        {
          "resourceURI": "http://gateway.marvel.com/v1/public/events/269",
          "name": "Secret Invasion"
        }
      ],
      "returned": 1
    },
    "urls": [
      {
        "type": "detail",
        "url":
            "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=77089e65b21f0f1b6ed3ded566abc7d3"
      },
      {
        "type": "wiki",
        "url":
            "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=77089e65b21f0f1b6ed3ded566abc7d3"
      },
      {
        "type": "comiclink",
        "url":
            "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=77089e65b21f0f1b6ed3ded566abc7d3"
      }
    ]
  };
  Map<String, dynamic> invalidMap = {
    "id": 1011334,
    "name": "3-D Man",
    "description": "",
    "modified": null,
    "thumbnail": {
      "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
      "extension": "jpg"
    },
    "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011334",
    "comics": {
      "available": 12,
      "collectionURI":
          "http://gateway.marvel.com/v1/public/characters/1011334/comics",
      "items": [
        {
          "resourceURI": "http://gateway.marvel.com/v1/public/comics/21366",
          "name": "Avengers: The Initiative (2007) #14"
        }
      ],
      "returned": 12
    },
    "series": {
      "available": 3,
      "collectionURI":
          "http://gateway.marvel.com/v1/public/characters/1011334/series",
      "items": [
        {
          "resourceURI": "http://gateway.marvel.com/v1/public/series/1945",
          "name": "Avengers: The Initiative (2007 - 2010)"
        }
      ],
      "returned": 3
    },
    "stories": {
      "available": 21,
      "collectionURI":
          "http://gateway.marvel.com/v1/public/characters/1011334/stories",
      "items": [
        {
          "resourceURI": "http://gateway.marvel.com/v1/public/stories/19947",
          "name": "Cover #19947",
          "type": "cover"
        }
      ],
      "returned": 20
    },
    "events": {
      "available": 1,
      "collectionURI":
          "http://gateway.marvel.com/v1/public/characters/1011334/events",
      "items": [
        {
          "resourceURI": "http://gateway.marvel.com/v1/public/events/269",
          "name": "Secret Invasion"
        }
      ],
      "returned": 1
    },
    "urls": [
      {
        "type": "detail",
        "url":
            "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=77089e65b21f0f1b6ed3ded566abc7d3"
      },
      {
        "type": "wiki",
        "url":
            "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=77089e65b21f0f1b6ed3ded566abc7d3"
      },
      {
        "type": "comiclink",
        "url":
            "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=77089e65b21f0f1b6ed3ded566abc7d3"
      }
    ]
  };

  MarvelCharacter marvelCharacter = MarvelCharacter(
    id: 1011334,
    name: "3-D Man",
    description: "",
    modified: "",
    thumbnail: Thumbnail(
      path: "http://gateway.marvel.com/v1/public/characters/1011334",
      extension: Extension.jpg,
    ),
    resourceUri: "http://gateway.marvel.com/v1/public/characters/1011334",
    comics: SectionInfo(
      available: 12,
      collectionUri:
          "http://gateway.marvel.com/v1/public/characters/1011334/comics",
      items: [],
      returned: 12,
    ),
    series: SectionInfo(
      available: 12,
      collectionUri:
          "http://gateway.marvel.com/v1/public/characters/1011334/comics",
      items: [],
      returned: 12,
    ),
    stories: SectionInfo(
      available: 12,
      collectionUri:
          "http://gateway.marvel.com/v1/public/characters/1011334/comics",
      items: [],
      returned: 12,
    ),
    events: SectionInfo(
      available: 12,
      collectionUri:
          "http://gateway.marvel.com/v1/public/characters/1011334/comics",
      items: [],
      returned: 12,
    ),
    urls: [],
  );

  group('MarvelCharacter.fromMap', () {
    test('map to MarvelCharacter model', () {
      final character = MarvelCharacter.fromMap(map);
      expect(character.id, 1011334);
      expect(character.name, "3-D Man");
      expect(character.description, "");
      expect(character.modified, "2014-04-29T14:18:17-0400");
      expect(character.thumbnail.path,
          "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784");
      expect(character.resourceUri,
          "http://gateway.marvel.com/v1/public/characters/1011334");
      expect(character.comics.available, 12);
      expect(character.series.available, 3);
      expect(character.stories.available, 21);
      expect(character.events.available, 1);
      expect(character.urls.length, 3);
    });

    test('throws an exception with an invalid map', () {
      expect(
        () => MarvelCharacter.fromMap(invalidMap),
        throwsA(predicate((e) {
          return e is Exception &&
              e.toString().contains('Error MarvelCharacter.fromMap');
        })),
      );
    });
  });

  group('MarvelCharacter.toMap', () {
    test('converts MarvelCharacter model to map', () {
      final map = marvelCharacter.toMap();

      expect(map['id'], 1011334);
      expect(map['name'], "3-D Man");
      expect(map['description'], "");
      expect(map['modified'], "");
      expect(map['thumbnail']['path'], "http://gateway.marvel.com/v1/public/characters/1011334");
      expect(map['resourceURI'], "http://gateway.marvel.com/v1/public/characters/1011334");
      expect(map['comics']['available'], 12);
      expect(map['series']['available'], 12);
      expect(map['stories']['available'], 12);
      expect(map['events']['available'], 12);
      expect(map['urls'].length, 0);
    });
  });
}
