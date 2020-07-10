import 'package:test/test.dart';

void main() {
  group('Working with the List Class →', () {
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

  group('create a list of fixed size →', () {
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
  group('create list from another list →', () {
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
  group('using the List.generate constructor →', () {
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

  group('other methods for working with lists →', () {
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

  group('to manually compare values to determine sorting order →', () {
    List<Map<String, Object>> apps;
    List<String> names;
    setUp(() {
      apps = [
        {'name': 'WordPress', 'version': 4},
        {'name': 'SourceTree', 'version': 2},
        {'name': 'Google Chrome', 'version': 38},
        {'name': 'Safari', 'version': 8}
      ];
    });
    test('names list', () {
      names = apps.map((e) => e['name'] as String).toList();
      expect(names,
          <String>['WordPress', 'SourceTree', 'Google Chrome', 'Safari']);
    });

    test('sort using `compare` function', () {
// compare function
      var compare = (Map<String, Object> a, Map<String, Object> b) =>
          (a['name'] as Comparable).compareTo(b['name']);
      apps.sort(compare);

      names = apps.map((e) => e['name'] as String).toList();
      expect(names,
          <String>['Google Chrome', 'Safari', 'SourceTree', 'WordPress']);
    });
  });
  group('shuffle →', () {
    List<int> my_list;
    setUp(() {
      my_list = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    });
    test('do shuffle', () {
      final newList = List.of(my_list);
      my_list.shuffle();
      expect(my_list.isNotEmpty, isTrue);

      expect(my_list.length, newList.length);
    });
  });

  group('indexOf →', () {
    List<int> my_list;
    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
    });
    test('get index by element value', () {
      expect(my_list.indexOf(3), 0);
      expect(my_list.indexOf(6), 1);
      expect(my_list.indexOf(8), 2);
      expect(my_list.indexOf(7), 3);
      expect(my_list.indexOf(5), 4);
      expect(my_list.indexOf(1), 5);
      expect(my_list.indexOf(2), 6);
      expect(my_list.indexOf(4), 7);
      expect(my_list.indexOf(9), 8);
      expect(my_list.indexOf(91), -1);
    });
  });
  group('lastIndexOf →', () {
    List<int> my_list;
    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
    });
    test('get lastIndexOf by element value', () {
      expect(my_list.lastIndexOf(3), 0);
      expect(my_list.lastIndexOf(6), 1);
      expect(my_list.lastIndexOf(8), 2);
      expect(my_list.lastIndexOf(7), 3);
      expect(my_list.lastIndexOf(5), 4);
      expect(my_list.lastIndexOf(1), 5);
      expect(my_list.lastIndexOf(2), 6);
      expect(my_list.lastIndexOf(4), 7);
      expect(my_list.lastIndexOf(9), 8);
      expect(my_list.indexOf(34), -1);
    });
  });

  group('insert →', () {
    List<int> my_list;
    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
    });
    test('insert', () {
      my_list.insert(0, 9);
      expect(my_list, [9, 3, 6, 8, 7, 5, 1, 2, 4, 9]);
    });
    test('index value is greate that array length', () {
      expect(() => my_list.insert(100, 90), throwsA(isRangeError));
    });
    test('index value to the fixed size array', () {
      final array = List(1);
      expect(() => array.insert(0, 1), throwsA(isUnsupportedError));
    });
    test('index value negative', () {
      expect(() => my_list.insert(-1, 9), throwsA(isRangeError));
    });
  });

  group('insert a list of values into another list →', () {
    List<int> my_list;
    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
    });
    test('insert [1, 1, 1]', () {
      my_list.insert(0, 9);
      my_list.insertAll(0, [1, 1, 1]);
      for (var i = 0; i < 3; i++) {
        expect(my_list[0], 1);
      }
    });
  });
  group(
      'replace values in a list with other values, and to do so at a specific position →',
      () {
    List<int> my_list;
    int length;
    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
      length = my_list.length;
    });
    test('setAll', () {
      my_list.setAll(0, [5, 5, 5]);
      expect(my_list.length, length);
      for (var i = 0; i < 3; i++) {
        expect(my_list[0], 5);
      }
    });
  });

  group('delete a specific value from a list →', () {
    List<int> my_list;
    int length;
    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
      length = my_list.length;
    });
    test('remove', () {
      my_list.remove(9);
      expect(my_list.length + 1, length);
      expect(my_list[my_list.length - 1], 4);
    });
  });
  group('remove an element at a given position →', () {
    List<int> my_list;
    int length;
    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
      length = my_list.length;
    });
    test('removeAt', () {
      my_list.removeAt(0);
      expect(my_list.length + 1, length);
      expect(my_list[0], 6);
    });
  });
  group('remove the last element of a list →', () {
    List<int> my_list;
    int length;
    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
      length = my_list.length;
    });
    test('removeLast', () {
      my_list.removeLast();
      expect(my_list.length + 1, length);
      expect(my_list[my_list.length - 1], 4);
    });
  });

  group('remove specific elements of a list →', () {
    List<int> my_list;
    int length;
    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
      length = my_list.length;
    });
    test('removeLast', () {
      my_list.removeWhere((e) => e < 3);
      expect(my_list.length + 2, length);
      expect(my_list[0], 3);
    });
  });

  group('get elements that satisfy the defined condition →', () {
    List<int> my_list;
    int length;
    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
      length = my_list.length;
    });
    test('nothing happend', () {
      my_list.retainWhere((e) => e != 13);
      expect(my_list.length, length);
    });
    test('remove all', () {
      my_list.retainWhere((e) => (e is! int));
      expect(my_list.length, 0);
    });
    test('get one', () {
      my_list.retainWhere((e) => (e == 9));
      expect(my_list.length, 1);
    });
  });

  group('keep a specific part of a list indicating the index range →', () {
    List<int> my_list;
    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
    });
    test('sublist', () {
      my_list = my_list.sublist(1, 4);
      expect(my_list.length, 3);
      expect(my_list, [6, 8, 7]);
    });
  });
  group(
      'return an iterable that lets you work with the elements indicated in the index from-to range →',
      () {
    List<int> my_list;
    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
    });
    test('getRange', () {
      my_list = my_list.getRange(1, 4).toList();
      expect(my_list.length, 3);
      expect(my_list, [6, 8, 7]);
    });
  });
  group('copy iterable values in the from-to range →', () {
    List<int> my_list;
    int length;
    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
      length = my_list.length;
    });
    test('setRange', () {
      var my_list2 = [7, 8, 9, 6];
      my_list.setRange(0, my_list2.length, my_list2);

      expect(my_list.length, length);
      expect(my_list, [7, 8, 9, 6, 5, 1, 2, 4, 9]);
    });
    test('set skip', () {
      var my_list2 = [7, 8, 9, 6];
      my_list.setRange(0, my_list2.length - 1, my_list2, 1);

      expect(my_list.length, length);
      expect(my_list, [8, 9, 6, 7, 5, 1, 2, 4, 9]);
    });
  });
  group('set the values in the from-to range with the specified value →', () {
    List<int> my_list;
    int length;
    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
      length = my_list.length;
    });
    test('fillRange', () {
      my_list.fillRange(0, 2, 0);

      expect(my_list.length, length);
      expect(my_list, [0, 0, 8, 7, 5, 1, 2, 4, 9]);
    });
  });

  group('delete the elements in the from-to range →', () {
    List<int> my_list;

    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
    });
    test('removeRange', () {
      my_list.removeRange(0, my_list.length);

      expect(my_list.length, 0);
      expect(my_list, []);
    });
  });

  group('delete the values in the from-to range and insert the values →', () {
    List<int> my_list;
    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
    });
    test('replaceRange', () {
      my_list.replaceRange(0, my_list.length - 1, [7, 8, 9]);

      expect(my_list.length, 4);
      expect(my_list, [7, 8, 9, 9]);
    });
  });

  group('convert a list into a dictionary →', () {
    List<int> my_list;

    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
    });
    test('asMap', () {
      var asMap = my_list.asMap();

      expect(my_list.length, asMap.length);
      expect(asMap.keys, List.generate(my_list.length, (index) => index));
      expect(asMap.values, my_list);
    });
  });

  group(' empty a list →', () {
    List<int> my_list;

    setUp(() {
      my_list = [3, 6, 8, 7, 5, 1, 2, 4, 9];
    });
    test('clear', () {
      my_list.clear();
      expect(my_list.length, 0);
      expect(my_list, []);
    });
  });
}
