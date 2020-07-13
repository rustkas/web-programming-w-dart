import 'package:animals/animals/animals.dart';
import 'package:test/test.dart';

void main() {
  test('create instance', () {
    final d = Dog();
    final c = Cat();
    final a = Animal();

    expect(d, isA<Animal>());
    expect(c, isA<Animal>());
    expect(a, isA<Animal>());
  });
}
