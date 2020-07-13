import 'package:test/test.dart';

class Person {
// Instance Variables
  String name; // the variable is initialized to null.
  num age; // the variable is initialized to null.
  num children = 0; // the variable is initialized to 0.
  Person(this.name, this.age);
  bool get isParent => (children > 0);
  set parent(bool p) => (p == true)
      ? (children > 0 ? children /* nothing to change */ : children = 1)
      : children = 0;
}

void main() {
  Person p1;
  setUp(() {
    p1 = Person('Mary', 19);
  });

  test('check parent', () {
    expect(p1.isParent, isFalse);

    p1.children = 2;
    expect(p1.children, 2);
    p1.parent = true;
    expect(p1.isParent, isTrue);
    expect(p1.children, 2);
  });

  test('no children', () {
    expect(p1.isParent, isFalse);
    p1.parent = true;
    expect(p1.isParent, isTrue);
    expect(p1.children, 1);
  });
}
