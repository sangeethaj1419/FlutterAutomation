import 'package:test/test.dart';
import 'package:flutter_test_application/models/favorites.dart';

void main() {
  group('Testing App Provider', () {
    var favorites = Favorites();

// test to add new item in favorites
    test('A new item should be added', () {
      var number = 35;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });

// test to remove item from list

    test('item should be removed from the list', () {
      var number = 21;
      favorites.remove(21);
      expect(favorites.items.contains(number), false);
    });
  });
}
