import 'package:test/test.dart';

class PasswordEmptyException implements Exception {}

void main() {
  group('throw exception ->', () {
    void throwFunction({user, password}) {
      if (user == null) {
        throw Exception('User not recognized in the system !!');
      }
      if (password == null) {
        throw Exception('The password is incorrect !!');
      }
    }

    test('no user', () {
      expect(() => throwFunction(), throwsA(isException));
    });
    test('no password', () {
      expect(() => throwFunction(user: 'admin'), throwsA(isException));
    });
  });

  group('throw argument error ->', () {
    void throwArgumentError({data}) {
      if (data == null) {
        throw ArgumentError();
      }
    }

    test('do it', () {
      expect(() => throwArgumentError(), throwsA(isArgumentError));
    });
  });

  group('throw type error ->', () {
    void throwTypeError({data}) {
      if (data is! Map) {
        throw TypeError();
      }
    }

    test('do it', () {
      expect(() => throwTypeError(data: {1: 'Test'}), returnsNormally);
    });
  });

  group('try-on-catch', () {
    var makeAction;
    void login(String password,
        {bool throwException = false, bool raiseError = false}) {
      if (password == '') {
        throw PasswordEmptyException();
      }
      if (throwException) {
        throw Exception('Just do it!');
      }
      if (raiseError) {
        throw Error();
      }
      makeAction = 'login';
    }

    void reLogin() {
      makeAction = 'relogin';
    }

    void action(
        {String password = '',
        bool throwException = false,
        bool raiseError = false}) {
      try {
        login(password, throwException: throwException, raiseError: raiseError);
      } on PasswordEmptyException {
        reLogin();
      } on Exception catch (_) {
        makeAction = 'What happend here?';
      } catch (_) {
        makeAction = 'Something has gone wrong. I have no idea what happened !';
      }
    }

    test('ok', () {
      expect(() => action(password: 'ok'), returnsNormally);
    });
    test('throw PasswordEmptyException', () {
      expect(() => action(), returnsNormally);
      expect(makeAction, 'relogin');
    });

    test('throw Exception', () {
      expect(
          () => action(password: 'ok', throwException: true), returnsNormally);
      expect(makeAction, 'What happend here?');
    });
    test('raise Error', () {
      expect(() => action(password: 'ok', raiseError: true), returnsNormally);
      expect(makeAction is String, isTrue);
      String value;
      value = makeAction as String;
      expect(value.startsWith('Something has gone wrong'), isTrue);
    });
  });

  group('try-catch-finally ->', () {
    String result;
    String login(String password) {
      if (password == '') {
        throw PasswordEmptyException();
      }
      return 'admin';
    }

    void action({String password = ''}) {
      var myresult;
      try {
// I try to gain access to the system.
        myresult = login(password);
      } on Exception catch (_) {
// An error occurs in the system.
        myresult = 'You did not say the magic word !';
      } finally {
        result = myresult;
      }
    }

    test('ok', () {
      expect(() => action(password: 'ok'), returnsNormally);
      expect(result, 'admin');
    });
    test('empty password', () {
      expect(() => action(), returnsNormally);
      expect(result.startsWith('You did not'), isTrue);
    });
  });

  test('FormatException', () {
    expect(() => int.parse('Test'), throwsA(isFormatException));
  });

  test('IntegerDivisionByZeroException', () {
    expect(() => 1 ~/ 0, throwsA(isException));
  });

  group('Error Types ->', () {
    test('AssertionError', () {
      var isOk = false;
      try {
        assert(false);
      } on AssertionError {
        isOk = true;
      } finally {
        expect(isOk, isTrue);
      }
    });
  });
}
