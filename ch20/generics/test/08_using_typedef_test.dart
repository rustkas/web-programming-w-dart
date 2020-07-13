import 'package:test/test.dart';

String log(String msg) => msg;

typedef Logger = void Function(String msg);

num sum(num a, num b, Logger logger) {
  logger(a?.toString());
  logger('+');
  logger(b?.toString());
  var res = a + b;
  logger('=');
  logger(res?.toString());
  return res;
}

void main() {
  test('check result', () {
    final result = sum(4, 9, log);
    expect(result, 13);
  });
}
