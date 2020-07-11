import 'package:test/test.dart';

void main() {
  test('if-else', () {
    void caution() {
      expect(true, isTrue);
    }

    void withoutCaution() {
      expect(true, isFalse);
    }

    var weather = 'risk';
    if (weather == 'risk') {
      caution();
    } else {
      withoutCaution();
    }
  });

  test('if-else-if', () {
    String result;
    final map = {'red': '#0000ff', 'green': '#00ff00', 'blue': '#0000ff'};

    var color = 'red';
    if (map[color] == '#0000ff') {
      result = map[color];
    } else if (map[color] == '#00ff00') {
      result = map[color];
    } else if (map[color] == '#0000ff') {
      result = map[color];
    } else {
      throw Exception('I dont know this color!');
    }
    expect(result, map['red']);
  });
}
