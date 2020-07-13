import 'dart:math' as math;
import 'package:animals/math.dart' as math_lib;
import 'package:test/test.dart';

void main() {
  
  test('check consts', () {
    expect(math.pi, isNotNull);
    expect(math_lib.alfa, isNotNull);
  });
}
