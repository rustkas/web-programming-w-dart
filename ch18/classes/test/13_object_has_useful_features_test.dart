import 'package:test/test.dart';

class Person {
// Instance Variables
  String name; // the variable is initialized to null.
  num age; // the variable is initialized to null.
  num children = 0; // the variable is initialized to 0.
// Constructor.
  Person(this.name, this.age);
  String sayHello() => ('Hi my name is $name and I\'m $age years old.');
  String work() => ('Working...');
  String eat() => ('Ummm delicious!');
  String sleep() => ('Good Night.. ZZZZZZZZ');
  String getSomeFun() => ('I love play HayDay');
}

void main() {
  var p1 = Person('Mary', 19);

  test('methods results', () {
    expect(p1.sayHello(), "Hi my name is Mary and I'm 19 years old.");
    expect(p1.eat(), 'Ummm delicious!');
    expect(p1.work(), 'Working...');
    expect(p1.eat(), 'Ummm delicious!');
    expect(p1.getSomeFun(), 'I love play HayDay');
    expect(p1.sleep(), 'Good Night.. ZZZZZZZZ');
  });
}
