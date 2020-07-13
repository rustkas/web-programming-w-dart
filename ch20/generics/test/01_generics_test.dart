import 'package:test/test.dart';

class Person {
  @deprecated
  String sayHello(String msg) => msg;
  String greet(String new_msg) => new_msg;
}

void main() {
  test('use depricate method', () {
    final person = Person();

    expect(person.sayHello('test'), 'test');
    expect(person.greet('Hello!'), 'Hello!');
  });
}
