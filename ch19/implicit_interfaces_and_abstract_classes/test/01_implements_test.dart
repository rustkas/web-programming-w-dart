import 'package:test/test.dart';

class Animal {
  final String _name;
  Animal(this._name);
  String speak() => 'Hi I\'m an Animal and my name is $_name';
}

class Dog implements Animal {
  @override
  String _name;

  @override
  String speak() => 'Hi I\'m a Dog and I have no name';
}

String sayHello(Animal animal) => animal.speak();
void main() {
  
  test('Animal', () {
    expect(sayHello(Animal('Boby')), "Hi I'm an Animal and my name is Boby");
  });

  test('Dog', () {
    expect(sayHello(Dog()), "Hi I'm a Dog and I have no name");
  });
}
