import 'package:flutter_test/flutter_test.dart';
import 'package:strat_plus_exam/src/models/item_model.dart';
import 'package:strat_plus_exam/src/models/section_info_model.dart';

void main() {
  Map<String, dynamic> map = {
    "available": 3,
    "collectionURI":
        "http://gateway.marvel.com/v1/public/characters/1011334/series",
    "items": [
      {
        "resourceURI": "http://gateway.marvel.com/v1/public/series/1945",
        "name": "Avengers: The Initiative (2007 - 2010)"
      },
      {
        "resourceURI": "http://gateway.marvel.com/v1/public/series/2005",
        "name": "Deadpool (1997 - 2002)"
      },
    ],
    "returned": 3
  };
  Map<String, dynamic> invalidMap = {
    "available": "3",
    "collectionURI":
        "http://gateway.marvel.com/v1/public/characters/1011334/series",
    "items": [
      {
        "resourceUri": "http://gateway.marvel.com/v1/public/series/1945",
        "name": "Avengers: The Initiative (2007 - 2010)"
      },
      {
        "resourceURI": "http://gateway.marvel.com/v1/public/series/2005",
        "name": "Deadpool (1997 - 2002)"
      },
      {
        "resourceURI": "http://gateway.marvel.com/v1/public/series/2045",
        "name": "Marvel Premiere (1972 - 1981)"
      }
    ],
    "returned": 3
  };

  SectionInfo sectionInfo = SectionInfo(
    available: 3,
    collectionUri:
        "http://gateway.marvel.com/v1/public/characters/1011334/series",
    items: [
      Item(
        resourceUri: "http://gateway.marvel.com/v1/public/series/1945",
        name: "Avengers: The Initiative (2007 - 2010)",
      ),
      Item(
        resourceUri: "http://gateway.marvel.com/v1/public/series/2005",
        name: "Deadpool (1997 - 2002)",
      ),
    ],
    returned: 3,
  );

  group('SectionInfo.fromMap', () {
    test('map to SectionInfo model', () {
      final section = SectionInfo.fromMap(map);
      expect(section.available, 3);
      expect(section.collectionUri,
          "http://gateway.marvel.com/v1/public/characters/1011334/series");
      expect(section.items.length, 2);
      expect(section.returned, 3);
    });

    test('throws an exception with an invalid map', () {
      expect(
        () => SectionInfo.fromMap(invalidMap),
        throwsA(predicate((e) {
          return e is Exception &&
              e.toString().contains('Error SectionInfo.fromMap');
        })),
      );
    });
  });

  group('SectionInfo.toMap', () {
    test('converts SectionInfo model to map', () {
      final map = sectionInfo.toMap();

      expect(map['available'], 3);
      expect(map['collectionURI'],
          'http://gateway.marvel.com/v1/public/characters/1011334/series');
      expect(map['items'].length, 2);
      expect(map['returned'], 3);
    });
  });
}
