import 'package:flutter_test/flutter_test.dart';
import 'package:strat_plus_exam/src/models/thumbnail_model.dart';

void main() {
  Map<String, dynamic> map = {
    'extension': 'jpg',
    'path': 'http://example.com/comic'
  };
  Map<String, dynamic> invalidMap = {
    'extension': 'invalid_type',
    'path': 'http://example.com/comic'
  };

  Thumbnail thumbnailModel = Thumbnail(extension: Extension.jpg, path: "http://example.com/comic");
  

  group('Thumbnail.fromMap', () {
    test('map to Thumbnail model', () {
      final thumbnail = Thumbnail.fromMap(map);
      expect(thumbnail.extension, Extension.jpg);
      expect(thumbnail.path, 'http://example.com/comic');
    });

    test('verify exception throw Error Thumbnail.fromMap', () {
      expect(
        () => Thumbnail.fromMap(invalidMap),
        throwsA(predicate((e) {
          if (e is Exception && e.toString().contains('Error Thumbnail.fromMap')) {
            return true;
          }
          return false;
        })),
      );
    });
  });

  group('Thumbnail.toMap', () {
    test('converts Thumbnail model to map', () {
      final map = thumbnailModel.toMap();
      expect(map['extension'], 'jpg');
      expect(map['path'], 'http://example.com/comic');
    });
  });
}
