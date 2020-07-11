import 'package:test/test.dart';

void main() {
  test('new Set', () {
    var con = <int>{};
    con.addAll([1, 1, 2, 3]);
    expect(con, {1, 2, 3});
  });

  test('Set.from', () {
    final list = [1, 1, 2, 2, 3, 3, 4];
    final con = Set.from(list);
    expect(con, {1, 2, 3, 4});
  });

  test('check if they contain a specific item', () {
    final list = [1, 1, 2, 2, 3, 3, 4, 5];
    final con = Set.from(list);
    expect(con.contains(1), isTrue);
    expect(con.contains(50), isFalse);
    expect(con.containsAll([2, 3, 5]), isTrue);
  });

  test('look for a specific value', () {
    final list = [1, 1, 2, 2, 3, 3, 4];
    final con = Set.from(list);
    expect(con.lookup(9), isNull);
    expect(con.lookup(4), isNotNull);
    expect(con.lookup(4), 4);
  });

  test('add items to the set', () {
    final list = [1, 1, 2, 2, 3, 3, 4];
    final con = Set.from(list);

    con.add(5);
    expect(con, {1, 2, 3, 4, 5});
    con.addAll([6, 7, 8, 9]);
    expect(con, {1, 2, 3, 4, 5, 6, 7, 8, 9});
  });

  test('remove items from a set', () {
    final list = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    final con = Set.from(list);

    con.remove(9);
    expect(con, {1, 2, 3, 4, 5, 6, 7, 8});

    con.removeAll([8, 7, 6]);
    expect(con, {1, 2, 3, 4, 5});

    con.removeWhere((e) => e == 5);
    expect(con, {1, 2, 3, 4});
  });

  test('return only some elements of a set', () {
    final list = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    final con = Set.from(list);

    con.retainAll([1, 2, 3]);
    expect(con, {1, 2, 3});
    con.retainWhere((e) => e.isOdd);
    expect(con, {1, 3});
  });

  test('intersection', () {
    final list1 = [1, 3];
    final list2 = [3, 4];
    var con = Set.from(list1);
    var con2 = Set.from(list2);
    expect(con.intersection(con2), {3});
  });

  test('union', () {
    final list1 = [1, 3];
    final list2 = [3, 4];
    var con = Set.from(list1);
    var con2 = Set.from(list2);
    expect(con.union(con2), {1, 3, 4});
  });

  test('difference', () {
    final list1 = [1, 3];
    final list2 = [3, 4];
    var con = Set.from(list1);
    var con2 = Set.from(list2);
    expect(con.difference(con2), {1});
  });
}
