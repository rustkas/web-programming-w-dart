import 'package:test/test.dart';

class Person {
  String name;
  num age;
  num children = 0;

  Person(String name, num age) {
    this.name = name;
    this.age = age;
  }
  String sayHello() => "Hi my name is $name and I'm $age years old.";
}

void main() {
  test('check instance member values', () {
    final p = Person('John Doe', 26);

    expect(p.sayHello(), 'Hi my name is John Doe and I\'m 26 years old.');
  });
}
