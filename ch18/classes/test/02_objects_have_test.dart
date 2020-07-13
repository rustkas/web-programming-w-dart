import 'package:test/test.dart';

class Person {
// Instance variables.
  String name;
  num age;
// Empty constructor.
  Person();
// Method that returns a greeting.
  String sayHello() => 'Hi my name is $name';
}

void main() {
  test('check instance of Person', () {
    final john = Person();
    john.name = 'John Doe';
    john.age = 29;
    john.sayHello();
    expect(john.name, 'John Doe');
    expect(john.age, 29);
    expect(john.sayHello(), 'Hi my name is John Doe');
  });
}
