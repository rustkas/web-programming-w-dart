import 'package:test/test.dart';

class Person {
  String name;
  num age;
  num children = 0;

  Person(String n, num a) {
    name = n;
    age = a;
  }

  Person.withoutChildren(String n, num a) : this(n, a);
  String sayHello() => "Hi my name is $name and I'm $age years old.";
}

void main() {
  test('check instance member values', () {
    final p = Person.withoutChildren('Alice', 19);

    expect(p.sayHello(), 'Hi my name is Alice and I\'m 19 years old.');

  });
}
