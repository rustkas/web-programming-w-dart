import 'package:test/test.dart';

class MyException implements Exception {
  final msg;
  const MyException([this.msg = '']);
  @override
  String toString() => 'Fatal Exception in the system. $msg';
}

void throwMyException() {
  throw MyException(); // Exception: Fatal Exception in the system.
}

void throwMyExceptionWithDescription(String description) {
  throw MyException(description); 
}

void main() {
  test('throw MyException', () {
    var isOk = false;

    try {
      throwMyException();
    } on MyException {
      isOk = true;
    } finally {
      expect(isOk, isTrue);
    }
  });
test('throw MyException with description', () {
    var isOk = false;

    try {
      throwMyExceptionWithDescription('Access Error.');
    } on MyException {
      isOk = true;
    } finally {
      expect(isOk, isTrue);
    }
  });
}
