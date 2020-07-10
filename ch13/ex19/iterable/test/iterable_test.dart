import 'package:test/test.dart';

void main() {
  group('using for-in loop →', () {
    setUp(() {});
    test('List []', () {
      final my_list = [1, 2, 3];
      for (var my_element in my_list) {
        expect(my_element, isIn(my_list));
      }
    });
    test('Set {}', () {
      final my_set = {true, false};
      for (var value in my_set) {
        expect(value, isIn(my_set));
      }
    });
    test('Map {}', () {
      final my_map = {'1': 'one', '2': 'two', '3': 'three'};
      for (var my_element in my_map.values) {
        expect(my_element, isIn(my_map.values));
      }
    });
    test('forEach method', () {
      final dicc = {'1': 'one', '2': 'two', '3': 'three'};
      dicc.keys.toList().forEach((k) {
        expect(k is String, isTrue);
        expect(k is int, isFalse);
      });
    });
    test('map method', () {
      final dicc = {'1': 'one', '2': 'two', '3': 'three'};
      final keys = dicc.keys.map((key) => int.parse(key));
      final newDicc = Map.fromIterables(keys, dicc.values);
      newDicc.keys.toList().forEach((k) {
        expect(k is String, isFalse);
        expect(k is int, isTrue);
      });
    });
  });
}
