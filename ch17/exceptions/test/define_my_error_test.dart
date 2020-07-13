import 'package:test/test.dart';

class MyError extends Error {
  final msg;
  MyError([this.msg = 'UNKNOWN']);
  @override
  String toString() => 'Error: $msg';
}

void throwMyError() {
  throw MyError(); // 
}

void throwMyErrorWithDescription(String description) {
  throw MyError(description);
}

void main() {
  test('throw MyError', () {
    var isOk = false;

    try {
      throwMyError();
    } on MyError {
      isOk = true;
    } finally {
      expect(isOk, isTrue);
    }
  });
  test('throw MyError with description', () {
    var isOk = false;

    try {
      throwMyErrorWithDescription('Access Error.');
    } on MyError {
      isOk = true;
    } finally {
      expect(isOk, isTrue);
    }
  });
}
