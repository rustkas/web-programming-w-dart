import 'package:test/test.dart';

void main() {
  test('Define a map', () {
    final literal_map = {
      1: 'values',
      'key': 12,
      true: 'true',
      'false': false,
      12.45: 12,
      [1, 2]: [1, 2],
      {1: 'one'}: {2: 'two'}
    };
    expect(literal_map is Map, isTrue);
  });

  test('add more key-value pairs to a map', () {
    var p1 = {'name': 'John', 'age': 29};
    p1['surname'] = 'Smith';
    expect(p1, {'name': 'John', 'age': 29, 'surname': 'Smith'});
  });
  test('add key-value in list way', () {
    var results = {};
    results[1] = 'Ranked first 1500 points';
    results[2] = 'Ranked second 990 points';
    results[3] = 'Ranked third 786 points';
    expect(results, {
      1: 'Ranked first 1500 points',
      2: 'Ranked second 990 points',
      3: 'Ranked third 786 points'
    });
  });

  test('Access to the keys of map', () {
    final p1 = {'name': 'John', 'surname': 'Smith'};
    expect(p1['name'], 'John');
    expect(p1['surname'], 'Smith');
  });
  test('Access to the keys of map 2', () {
    final p2 = {'name': 'John', 'age': 32};
    expect(p2['name'], 'John');
    expect(p2['surname'], isNull);
  });
  test('specify the data type of the key values and the map values', () {
    Map<String, double> champions;

    champions = {
      'Sebastian Vettel': 397.0,
      'Fernando Alonso': 242.0,
      'Mark Webber': 199.0
    };
    expect(champions is Map<String, double>, isTrue);
  });
  test('specify the data type of the key values and the map values 2', () {
    Map<int, List> positions;
    positions = {
      1: [1, 3, 4, 1, 7, 8],
      2: [4, 13, 1, 2, 4, 5],
      3: [7, 8, 9, 10, 2, 4]
    };
    expect(positions is Map<int, List>, isTrue);
  });
  test('create new maps from other maps', () {
    final p1 = {'nombre': 'John', 'age': 29};
    final p2 = Map.from(p1);
    p2['age'] = 32;
    expect(p2, {'nombre': 'John', 'age': 32});
  });

  test('create new maps from for', () {
    final my_list = ['one', 'two', 'three', 'four'];
    final my_map = {for (var item in my_list) item.toString().length: item};
    expect(my_map, {3: 'two', 5: 'three', 4: 'four'});
  });

  test('create new maps from iterables', () {
    final keys = [1, 2, 3];
    final values = ['one', 'two', 'three'];
    final my_map2 = Map.fromIterables(keys, values);
    expect(my_map2, {1: 'one', 2: 'two', 3: 'three'});
  });
  test('if it contains a specific key or value', () {
    final my_map = {1: 'one', 2: 'two', 3: 'three'};
    expect(my_map.containsKey('7'), isFalse);
    expect(my_map.containsKey(2), isTrue);

    expect(my_map.containsValue('7'), isFalse);
    expect(my_map.containsValue('three'), isTrue);
  });

  test('add a key if it does not exist on the object', () {
    final my_map = {1: 'one', 2: 'two', 3: 'three'};
    my_map.putIfAbsent(4, () => 'four');
    expect(my_map, {1: 'one', 2: 'two', 3: 'three', 4: 'four'});
  });
  test('add other key-value pairs ', () {
    final my_map = {1: 'one', 2: 'two', 3: 'three', 4: 'four'};
    my_map.addAll({5: 'five', 6: 'six'});
    expect(my_map,
        {1: 'one', 2: 'two', 3: 'three', 4: 'four', 5: 'five', 6: 'six'});
  });

  test('delete a key from the map object', () {
    final my_map = {
      1: 'one',
      2: 'two',
      3: 'three',
      4: 'four',
      5: 'five',
      6: 'six'
    };
    my_map.remove(5);
    expect(my_map, {1: 'one', 2: 'two', 3: 'three', 4: 'four', 6: 'six'});
  });

  test('apply a function to each key-value pair with forEach', () {
    final my_map = {1: 'one', 2: 'two', 3: 'three', 4: 'four', 6: 'six'};
    my_map.forEach((k, v) {
      expect(k is int && my_map[k] is String, isTrue);
    });
  });

  test('several useful map properties', () {
    final my_map = {1: 'one', 2: 'two', 3: 'three', 4: 'four', 6: 'six'};
    expect(my_map.keys, [1, 2, 3, 4, 6]);
    expect(my_map.values, ['one', 'two', 'three', 'four', 'six']);
    expect(my_map.length, 5);
    expect(my_map.isEmpty, isFalse);
    ;
    expect(my_map.isNotEmpty, isTrue);
    ;
  });
}
