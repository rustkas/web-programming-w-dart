import 'package:test/test.dart';

class Animal {
  String name;
  Animal(this.name);
  String greet() => 'Hi!';
  String eat() => 'eating...';
}

class Dog implements Animal {
  @override
  String name;
  Dog(this.name);
  @override
  String greet() => 'Woof!';
  @override
  String eat() => 'ummmm....';
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
      expect(dog.greet(), 'Woof!');
      expect(dog.eat(), 'ummmm....');
    });
  });
}
