import 'package:test/test.dart';

class FixMe {
  final String note;
  const FixMe(this.note);
}

class Person {
  @FixMe('Find better name')
  String eat() => 'eating...';
}

void main() {
  test('FixMe', () {
    final person = Person();
    expect(person.eat(), 'eating...');
  });
}
