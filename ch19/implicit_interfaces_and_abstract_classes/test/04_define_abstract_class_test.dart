import 'package:test/test.dart';

abstract class GeometricFigure {
  void draw();
}

class Circle extends GeometricFigure {
  @override
  void draw() {}
}

void main() {
  Circle circle;

  group('define abstract class', () {
    setUp(() {
      circle = Circle();
    });
    test('check instansiation', () {
      expect(() {
        circle.draw();
        
      }, returnsNormally);
    });
  });
}
