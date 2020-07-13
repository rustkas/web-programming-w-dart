import 'package:animals/animals/animals.dart';
import 'package:test/test.dart';

void main() {
  test('create instance', () {
  final ani = Animal();
  final dog = Yorkshire();
  final bird = Canary();

    expect(ani, isA<Animal>());
    expect(dog, isA<Animal>());
    expect(bird, isA<Animal>());
  });
}
