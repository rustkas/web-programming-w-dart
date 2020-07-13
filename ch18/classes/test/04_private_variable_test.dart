import 'package:test/test.dart';

class Person {
// Instance variables.
  String name;
  num age;
  num _id; // Private variable

  Person() {
    _id = 0;
  }
  String sayHello() => 'Hi my name is $name ($_id)';
}

void main() {
  test('private member', () {
    final person = Person();
    person.name = 'John';
    expect(person.sayHello(), 'Hi my name is John (0)');
  });
}
