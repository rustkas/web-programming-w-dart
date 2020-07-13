import 'package:test/test.dart';

class Person {
  String name;
  num age;
  num children = 0;

  Person(this.name, this.age);

// Named constructor.
  Person.json(Map data) {
    name = data['name'];
    age = data['age'];
    children = data['children'];
  }

  String sayHello() => "Hi my name is $name and I'm $age years old.";
}

void main() {
  test('check instance member values', () {
    final p = Person.json({'name': 'John Doe', 'age': 26});

    expect(p.sayHello(), 'Hi my name is John Doe and I\'m 26 years old.');

    final p2 = Person.json({'name': 'Michael', 'age': 45, 'children': 2});
    expect(p2.sayHello(), 'Hi my name is Michael and I\'m 45 years old.');

  });
}
