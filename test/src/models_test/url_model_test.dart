import 'package:flutter_test/flutter_test.dart';
import 'package:strat_plus_exam/src/models/url_model.dart';

void main() {
  Map<String, dynamic> map = {
    'type': 'comiclink',
    'url': 'http://example.com/comic'
  };
  Map<String, dynamic> invalidMap = {
    'type': 'invalid_type',
    'url': 'http://example.com/comic'
  };

  Url urlModel = Url(type: UrlType.comiclink, url: 'http://example.com/comic');

  group('Url.fromMap', () {
    test('map to Url model', () {
      final url = Url.fromMap(map);
      expect(url.type, UrlType.comiclink);
      expect(url.url, 'http://example.com/comic');
    });

    test('verify exception throw Error Url.fromMap', () {
      expect(
        () => Url.fromMap(invalidMap),
        throwsA(predicate((e) {
          if (e is Exception && e.toString().contains('Error Url.fromMap')) {
            return true;
          }
          return false;
        })),
      );
    });
  });

  group('Url.toMap', () {
    test('converts Url model to map', () {
      final map = urlModel.toMap();
      expect(map['type'], 'comiclink');
      expect(map['url'], 'http://example.com/comic');
    });
  });
}
