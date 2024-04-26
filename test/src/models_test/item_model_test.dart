import 'package:flutter_test/flutter_test.dart';
import 'package:strat_plus_exam/src/models/item_model.dart';

void main() {
  Map<String, dynamic> map = {
    'name': 'Axel',
    'resourceURI': 'http://example.com/comic'
  };

    Map<String, dynamic> invalidMap = {
    'name': null,
    'resourceURI': 'http://example.com/comic'
  };

  Item itemModel = Item(name: 'Axel', resourceUri: 'http://example.com/comic');

  group('Item.fromMap', () {
    test('map to Item model', () {
      final item = Item.fromMap(map);
      expect(item.name, 'Axel');
      expect(item.resourceUri, 'http://example.com/comic');
    });

    test('verify exception throw Error Item.fromMap', () {
      expect(
        () => Item.fromMap(invalidMap),
        throwsA(predicate((e) {
          if (e is Exception && e.toString().contains('Error Item.fromMap')) {
            return true;
          }
          return false;
        })),
      );
    });
    
  });

  group('Item.toMap', () {
    test('converts Item model to map', () {
      final map = itemModel.toMap();
      expect(map['name'], 'Axel');
      expect(map['resourceURI'], 'http://example.com/comic');
    });
  });
}
