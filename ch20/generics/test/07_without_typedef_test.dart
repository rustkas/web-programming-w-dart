import 'package:test/test.dart';

void log(String msg) => print(msg);

num sum(num a, num b, logger) {
  logger(a);
  logger('+');
  logger(b);
  var res = a + b;
  logger('=');
  logger(res);
  return res;
}

void main() {
  test('catch TypeError', () {
    bool result;
    result = false;
    try {
      sum(4, 9, log);
    } on TypeError {
      result = true;
    } finally {
      expect(result, isTrue);
    }
  });
}
