import 'dart:math' show pi, min, max;

import 'package:test/test.dart';

void main() {
  test('check consts', () {
    expect(pi, isNotNull);

    expect(min(0, 1), 0);
    expect(max(0, 1), 1);

// expect(e, isNotNull); math:e is not found
  });
}
