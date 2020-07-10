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
  });
  test('forEach List', () {
    final dicc = {'1': 'one', '2': 'two', '3': 'three'};
    dicc.keys.toList().forEach((k) {
      expect(k is String, isTrue);
      expect(k is int, isFalse);
    });
  });
  test('map', () {
    final dicc = {'1': 'one', '2': 'two', '3': 'three'};
    final keys = dicc.keys.map((key) => int.parse(key));
    final newDicc = Map.fromIterables(keys, dicc.values);
    newDicc.keys.toList().forEach((k) {
      expect(k is String, isFalse);
      expect(k is int, isTrue);
    });
  });
  test('where', () {
    final dicc = {'1': 'one', '2': 'two', '3': 'three'};
    final odd = dicc.keys.where((e) => int.parse(e).isOdd);
    for (var item in odd) {
      expect(item, isIn(['1', '3']));
    }
  });
  test('expand', () {
    final queryString = 'arg1=value1&arg2=value2&arg3=value3';
    var arguments = queryString.split('&');
    for (var item in arguments) {
      expect(item, isIn(['arg1=value1', 'arg2=value2', 'arg3=value3']));
    }
    arguments = arguments.expand((String arg) => arg.split('=')).toList();
    for (var item in arguments) {
      expect(
          item, isIn(['arg1', 'value1', 'arg2', 'value2', 'arg3', 'value3']));
    }
  });
  test('contains', () {
    final dicc = {'1': 'one', '2': 'two', '3': 'three'};
    expect(dicc.keys.contains('4'), isFalse);
    expect(dicc.keys.contains('1'), isTrue);
    expect(dicc.values.contains('two'), isTrue);
    expect(dicc.values.contains('three'), isTrue);
  });
  test('forEach Iterable', () {
    final dicc = {'1': 'one', '2': 'two', '3': 'three'};

    dicc.keys.forEach((String key) {
      final keyValue = int.tryParse(key);
      expect(keyValue is int, isTrue);
      expect(keyValue, isIn([1, 2, 3]));
    });
  });
  test('reduce', () {
    final dicc = {1: 'one', 2: 'two', 3: 'three'};
    final keys_sum = dicc.keys.reduce((total, element) => total + element);
    expect(keys_sum, 6);
  });
  test('fold', () {
    final dicc = {1: 'one', 2: 'two', 3: 'three'};
    final keys_sum = dicc.keys.fold(45, (total, element) => total + element);
    expect(keys_sum, 51);
  });
  test('every', () {
    final dicc = {1: 'one', 2: 'two', 3: 'three'};
    var keys = dicc.keys.every((e) => e.isEven);
    expect(keys, isFalse);
    keys = dicc.keys.every((e) => e is int);
    expect(keys, isTrue);
  });
  test('any', () {
    final dicc = {1: 'one', 2: 'two', 3: 'three'};
    var keys = dicc.keys.any((key) => key.isOdd);
    expect(keys, isTrue);
    keys = dicc.keys.any((key) => key.isEven);
    expect(keys, isTrue);
  });
  test('join', () {
    final dicc = {1: 'one', 2: 'two', 3: 'three'};

    final keys = dicc.keys.join('--');
    expect(keys, '1--2--3');
  });
  test('convert an iterable to List or Set', () {
    final dicc = {1: 'one', 2: 'two', 3: 'three'};
    expect(dicc.keys.toList(), [1, 2, 3]);
    expect(dicc.keys.toList(), {1, 2, 3});
  });
  test('find the length of an iterable and whether it’s empty or not', () {
    var dicc = {1: 'one', 2: 'two', 3: 'three'};
    expect(dicc.keys.length, 3);
    expect(dicc.keys.isEmpty, isFalse);
    expect(dicc.keys.isNotEmpty, isTrue);
  });
  test('get the first, last element or sigle', () {
    var dicc = {1: 'one', 2: 'two', 3: 'three'};
    expect(dicc.keys.first, 1);
    expect(dicc.keys.last, 3);
    expect(() => dicc.keys.single, throwsStateError);
    dicc = {1: 'one'};
    expect(dicc.keys.single, 1);
  });

  test('get a specific element at a given position', () {
    final dicc = {1: 'one', 2: 'two', 3: 'three'};
    final list = dicc.values.toList();
    final iterable = dicc.values;
    expect(iterable.elementAt(0), list[0]);
    expect(iterable.elementAt(1), list[1]);
  });
  test('retrieve a specified number of elements', () {
    final dicc = {1: 'one', 2: 'two', 3: 'three'};
    expect(dicc.values.take(2), ['one', 'two']);
  });
  test(
      'retrieve a certain number of items, which requires the indication of one condition',
      () {
    final dicc = {1: 'one', 2: 'two', 3: 'three'};
    expect(dicc.keys.takeWhile((k) => k.isEven), []);
    expect(dicc.keys.takeWhile((k) => k.isOdd), [1]);
    expect(dicc.keys.takeWhile((k) => k is int), [1, 2, 3]);
  });
  test('discard some elements', () {
    final dicc = {1: 'one', 2: 'two', 3: 'three', 4: 'four'};
    expect(dicc.values.skip(2), ['three', 'four']);
    expect(dicc.keys.skipWhile((k) => k.isEven), [1, 2, 3, 4]);
    expect(dicc.keys.skipWhile((k) => k.isOdd), [2, 3, 4]);
  });

  test(
      'keep the first, the last, and the only element that meets a specific condition',
      () {
    var dicc = {1: 'one', 2: 'two', 3: 'three', 4: 'four'};

    expect(dicc.keys.firstWhere((k) => k.isOdd), 1);
    expect(dicc.keys.lastWhere((k) => k.isOdd), 3);
    expect(() => dicc.keys.singleWhere((k) => k.isEven), throwsStateError);
    dicc.remove(4);
    expect(dicc.keys.singleWhere((k) => k.isEven), 2);
  });
}
