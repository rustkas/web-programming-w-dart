import 'package:test/test.dart';

class Car {
  static num maximum_speed = 120;
}

void main() {
  test('static variable', () {
    expect(Car.maximum_speed, 120);
  });
}
