import 'package:test/test.dart';

void main() {
  group('Working with the List Class ->', () {
    test('new List()', () {
      var empty_list = [];

      expect(empty_list is List, isTrue);
      expect(empty_list, isEmpty);
    });
  });

  test('Create a fixed-length list', () {
    final empty_list = List(2);
    expect(empty_list is List, isTrue);
    expect(empty_list, isNotEmpty);
    expect(empty_list, hasLength(2));
    expect(empty_list, same(empty_list));
    expect(empty_list, contains(null));
    expect(empty_list, [null, null]);
  });

  group('create a list of fixed size ->', () {
    test('list of numbers', () {
      final my_filled_list_num = List.filled(3, 0);
      expect(my_filled_list_num, [0, 0, 0]);
    });
    test('list of strings', () {
      final my_filled_list_str = List.filled(3, 'A');
      expect(my_filled_list_str, ['A', 'A', 'A']);
    });
    test('list of maps', () {
      final my_filled_list_map = List.filled(3, {});
      expect(my_filled_list_map, [{}, {}, {}]);
    });
  });
  group('create list from another list ->', () {
    List<String> my_filled_list_str;
    setUp(() {
      my_filled_list_str = List.filled(3, 'A');
    });
    test('using constructor List.from', () {
      final my_list_from_another =
          List.from(my_filled_list_str, growable: true);
      expect(my_list_from_another, ['A', 'A', 'A']);
    });
    test('add an item', () {
      final my_list_from_another =
          List.from(my_filled_list_str, growable: true);
      my_list_from_another.add('B');
      expect(my_list_from_another, ['A', 'A', 'A', 'B']);
    });
  });
  group('using the List.generate constructor ->', () {
    List<String> other_list;
    setUp(() {
      other_list = ['/etc/', '/home/pi/'];
    });

    test('using List.generate', () {
      var my_iterator_list_1 =
          List.generate(other_list.length, (e) => other_list[e].split('/'));
      expect(my_iterator_list_1, [
        ['', 'etc', ''],
        ['', 'home', 'pi', '']
      ]);
    });
    test('discarding empty elements', () {
      var my_iterator_list_1 = List.generate(other_list.length,
          (e) => other_list[e].split('/').where((e) => e != '').toList());
      expect(my_iterator_list_1, [
        ['etc'],
        ['home', 'pi']
      ]);
    });
  });

  group('other methods for working with lists ->', () {
    List<int> my_list;
    setUp(() {
      my_list = [1, 2, 3];
    });
    test('length', () {
      expect(my_list.length, 3);
    });
    test('change length', () {
      my_list.length = 5;
      expect(my_list.length, 5);
    });
    test('access a specific position and get its value', () {
      expect(my_list[1], 2);
    });
    test('assign values to these positions', () {
      my_list.length = 5;
      my_list[3] = 4;
      my_list[4] = 5;
      expect(my_list, [1, 2, 3, 4, 5]);
    });
    test('use the add() method to add items to the list', () {
      my_list.add(6);
      expect(my_list, [1, 2, 3, 6]);
    });
    test('add one list to another', () {
      my_list.addAll([7, 8, 9]);
      expect(my_list, [1, 2, 3, 7, 8, 9]);
    });
    test('turn over the list with the `reversed` property', () {
      my_list.addAll([4, 5, 6, 7, 8, 9]);

      expect(my_list.reversed, [9, 8, 7, 6, 5, 4, 3, 2, 1]);
    });
    test('sort a list', () {
      my_list.addAll([4, 5, 6, 7, 8, 9]);
      my_list.sort();
      expect(my_list, [1, 2, 3, 4, 5, 6, 7, 8, 9]);
    });
  });

  group(' to manually compare values to determine sorting order', () {
    List<Map<String,Object>> apps;
    setUp(() {
       apps = [
        {'name': 'WordPress', 'version': 4},
        {'name': 'SourceTree', 'version': 2},
        {'name': 'Google Chrome', 'version': 38},
        {'name': 'Safari', 'version': 8},
      ];
    });
apps.

  });
}
