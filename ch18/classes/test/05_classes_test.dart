import 'package:test/test.dart';

class Person {
  Person();
}

void main() {
  test('is instance of', () {
    final john = Person();
    expect(john, isA<Person>());
  });
}
