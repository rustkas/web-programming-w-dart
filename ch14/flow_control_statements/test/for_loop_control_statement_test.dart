import 'package:test/test.dart';

void main() {
  test('default view', () {
    for (var i = 0; i < 3; i++) {
      expect(i, isIn([0, 1, 2]));
    }
  });

  test('iterate over objects', () {
    final my_list = [1, 2, 3, 4, 5];
    final length = my_list.length;
    var count = 0;
    for (var i = 0; i < my_list.length; i++) {
      expect(my_list[i], isIn(my_list));
      count++;
    }
    expect(length, count);
  });

  test('forEach method', () {
    final my_list = ['one', 'two', 'three', 'four'];
    my_list.forEach((item) {
      expect(item, isIn(my_list));
    });
  });

  test('for-in loop', () {
    final documents = ['orders', 'invoices'];
    for (var doc in documents) {
      expect(doc, isIn(documents));
    }
  });
}
