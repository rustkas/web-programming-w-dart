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
    expect(my_date is DateTime, isTrue);
    expect(my_date.isUtc, isTrue);
  });
  test('define DateTime from a timestamp indicating milliseconds', () {
    final my_date = DateTime.fromMillisecondsSinceEpoch(1394280000000);
    expect(my_date is DateTime, isTrue);
  });
  test('define DateTime from a timestamp indicating milliseconds as UTC', () {
    final my_date =
        DateTime.fromMillisecondsSinceEpoch(1394280000000, isUtc: true);
    expect(my_date is DateTime, isTrue);
    expect(my_date.isUtc, isTrue);
  });
  test('obtain the values of the DateTime', () {
    final my_date = DateTime.parse('2014-03-08 18:52:33.906');
    expect(my_date is DateTime, isTrue);
    expect(my_date.year, 2014);
    expect(my_date.month, 3);
    expect(my_date.day, 8);
    expect(my_date.hour, 18);
    expect(my_date.minute, 52);
    expect(my_date.second, 33);
    expect(my_date.millisecond, 906);
    expect(my_date.weekday, 6); // 6 - Saturday
  });
  test('get local time time from a DateTime object', () {
    var my_date = DateTime.parse('2014-03-08 18:52:33.906');
    my_date = my_date.toLocal();
    expect(my_date.toString(), '2014-03-08 18:52:33.906');
  });
  test('get universal time from a DateTime object', () {
    var my_date = DateTime.parse('2014-03-08 18:52:33.906');
    my_date = my_date.toUtc();
    expect(my_date.toString(), '2014-03-08 17:52:33.906Z');
  });

  test('define objects by numbers', () {
    final yesterday = DateTime(2014, 3, 7, 18, 23, 0);
    expect(yesterday is DateTime, isTrue);
  });
  test('compare objects', () {
    final today = DateTime.parse('2014-03-08 18:52:33.906');
    final yesterday = DateTime(2014, 3, 7, 18, 23, 0);
    expect(today == yesterday, isFalse);
    expect(today.isAtSameMomentAs(today), isTrue);
    expect(today.isBefore(yesterday), isFalse);
    expect(today.isAfter(yesterday), isTrue);
  });

  test('compareTo', () {
    final today = DateTime.parse('2014-03-08 18:52:33.906');
    final yesterday = DateTime(2014, 3, 7, 18, 23, 0);
    expect(today.compareTo(yesterday), 1);
    expect(yesterday.compareTo(today), -1);
    expect(today.compareTo(today), 0);
  });

  test('define Duration', () {
    final dur = Duration(
        days: 20,
        hours: 4,
        minutes: 2,
        seconds: 17,
        milliseconds: 300,
        microseconds: 155897);
    expect(dur.toString(), '484:02:17.455897');
  });

  test(
      'get the value in days, hours, minutes, seconds, milliseconds, or microseconds',
      () {
    final dur = Duration(
        days: 20,
        hours: 4,
        minutes: 2,
        seconds: 17,
        milliseconds: 300,
        microseconds: 155897);
    expect(dur.inDays, 20);
    expect(dur.inDays, 20);
    expect(dur.inHours, 484);
    expect(dur.inMinutes, 29042);
    expect(dur.inSeconds, 1742537);
    expect(dur.inMilliseconds, 1742537455);
    expect(dur.inMicroseconds, 1742537455897);
  });

  test('add a day to a date', () {
    final today = DateTime.parse('2014-03-08 18:52:33.906');
    final newDate = today.add(Duration(days: 1));
    expect(newDate.day, today.day + 1);
  });

  test('add a day to a date', () {
    final today = DateTime.parse('2014-03-08 00:52:33.906');
    final newDate = today.add(Duration(hours: 10));
    expect(newDate.hour, today.hour + 10);
  });

  test('subtract duration', () {
    final today = DateTime.parse('2014-03-08 23:52:33.906');
    final newDate = today.subtract(Duration(hours: 10));
    expect(newDate.hour, today.hour - 10);
    final yestoday = today.subtract(Duration(days: 1));
    expect(yestoday.day, today.day - 1);
  });

  test('difference between two dates', () {
    final today = DateTime(2014, 10, 9, 18, 23, 0);
    final yesterday = DateTime(2014, 10, 7, 18, 23, 0);
    expect(today.difference(yesterday).inDays, 2);
    expect(today.difference(yesterday).inHours, 48);
    expect(today.difference(yesterday).inSeconds, 172800);
  });

  test('get the name of the client time zone', () {
    final today = DateTime(2014, 10, 9, 18, 23, 0);
    
    expect(today.timeZoneOffset, isNotNull);
    expect(today.timeZoneOffset is Duration, isTrue);
  });
  test('get the offset', () {
    final today = DateTime(2014, 10, 9, 18, 23, 0);
    
    expect(today.timeZoneOffset, isNotNull);
    expect(today.timeZoneOffset is Duration, isTrue);
  });
}
