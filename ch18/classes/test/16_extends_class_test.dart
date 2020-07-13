// Base class for animals
import 'package:test/test.dart';

class Animal {
  String species;
  String variety;
  Animal(this.species, this.variety);

  String breathe() {
    final sb = StringBuffer();
    sb.writeln('Configuring respiratory system...');
    sb.writeln('Respiratory system configured!');
    return sb.toString();
  }

  String eat() {
    final sb = StringBuffer();
    sb.writeln('Configuring digestive system...');
    sb.writeln('Digestive system configured!');
    return sb.toString();
  }
}

// Concrete class for Dogs
class Dog extends Animal {
  String colour;
  num paws;
  Dog(String variety, String color, num paws) : super('mammal', variety) {
    colour = color;
    this.paws = paws;
  }
  @override
  String breathe() {
    final sb = StringBuffer(super.breathe());
    sb.writeln("I'm breathing by muzzle");
    return sb.toString();
  }
}

void main() {
  Dog dog;

  group('extends class', () {
    setUp(() {
      dog = Dog('Golden Retriever', 'yellow', 4);
    });
    test('breathe', () {
      final result = dog.breathe();
      final sb = StringBuffer();
      sb.writeln('Configuring respiratory system...');
      sb.writeln('Respiratory system configured!');
      sb.writeln("I'm breathing by muzzle");

      expect(result, sb.toString());
    });

    test('eat', () {
      final result = dog.eat();
      final sb = StringBuffer();
      sb.writeln('Configuring digestive system...');
      sb.writeln('Digestive system configured!');
      expect(result, sb.toString());
    });
  });
}
