import 'package:test/test.dart';

class Animal {
  String name;
  Animal(this.name);
  String greet() => 'Hi!';
}

class Dog extends Animal {
  Dog(String name) : super(name);

  String eat() => 'eating...!';
}

void main() {
  Dog dog;
  group('extends', () {
    setUp(() {
      dog = Dog('Barry');
    });

    test('Animal', () {
      expect(dog, isNotNull);
      expect(dog is Animal, isTrue);
    });
  });
}
