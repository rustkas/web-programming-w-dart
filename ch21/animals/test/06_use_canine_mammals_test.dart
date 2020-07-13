import 'package:animals/canine_mammals.dart';
import 'package:test/test.dart';

void main() {
  final ani = Animal();
  final dog_y = Yorkshire();
  final dog_b = Beagle();

  test('check instances', () {
    expect(ani, isA<Animal>());
    expect(dog_y, isA<Animal>());
    expect(dog_b, isA<Animal>());
  });
}
