import 'package:test/test.dart';

void main() {
  test('now', () {
    final my_date = DateTime.now();
    expect(my_date is DateTime, isTrue);
  });
  test('ISO 8601 format', () {
    final my_date = DateTime.parse('2014-12-09 09:00:00');
    expect(my_date is DateTime, isTrue);
  });
  test('define DateTime objects directly in universal time', () {
final my_date = DateTime.utc(2014, 10, 7, 17, 30, 0);
print(my_date); // 2014-10-07 17:30:00.000Z
print(my_date.isUtc); // true
});
}
