import 'dart:math';

import 'package:test/test.dart';

void main() {
  group('while-do, do-while →', () {
    int count;
    StringBuffer sb;

    bool missingCalls() {
      if (count > 5) {
        return false;
      }
      count++;
      return true;
    }

    void blinkLight() {
      final currentLength = sb.length;
      sb.write('💡');
      expect(sb.length, currentLength + 2);
    }

    setUp(() {
      count = 0;
      sb = StringBuffer();
    });
    test('repeats a block of code while a condition remains true', () {
      while (missingCalls()) {
        blinkLight();
      }
      expect(sb.toString().length, 12);
    });

    test('evaluate the condition after executing the loop cycle', () {
      do {
        blinkLight();
      } while (missingCalls());
      expect(sb.toString().length, 14);
    });
  });
  test('using break', () {
    var i = 100;
    var tmp;

    while (true) {
      tmp = i;
      i -= 5;
      expect(i, tmp - 5);
      if (i < 75) {
        expect(i < 75, isTrue);
        break;
      }
    }
  });
  test('using break with marker', () {
    var i = 100;
    var tmp;
    marker:
    while (true) {
      while (true) {
        while (true) {
          tmp = i;
          i -= 5;
          expect(i, tmp - 5);
          if (i < 75) {
            expect(i < 75, isTrue);
            break marker;
          }
        }
      }
    }
  });
  test('jump to the next iteration of the loop', () {
    for (var i = 100; i > 0; i--) {
      if (i.isEven) {
        expect(i % 2, 0);
        continue;
      }
      if (i < 75) {
        break;
      }
    }
  });
  test('jump to the next iteration of the loop with marker', () {
    marker:
    for (var i = 100; i > 0; i--) {
      if (i.isEven) {
        expect(i % 2, 0);
        continue marker;
      }
      if (i < 75) {
        break marker;
      }
    }
  });
}
