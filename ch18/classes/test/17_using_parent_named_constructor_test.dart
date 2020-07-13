import 'package:test/test.dart';

class Animal {
  String name;
  String type;
  String breed;
  num age;
  num paws;
  Animal();
  Animal.json(Map data) {
    name = data['name'];
    type = data['type'];
    breed = data['breed'];
    age = data['age'];
    paws = data['paws'];
  }
}

class Dog extends Animal {
  Dog.json(Map data) : super.json(data);
}

void main() {
  group('using parent named constructor', () {
    Dog dog;
    setUp(() {
      dog = Dog.json({
        'name': 'Barry',
        'type': 'big',
        'breed': 'Belgian shepherd',
        'age': 4,
        'paws': 4
      });
    });

    test('check it', () {
      expect(dog.name, 'Barry');
    });
  });
}
