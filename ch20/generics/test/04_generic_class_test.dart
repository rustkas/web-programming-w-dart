// We define the class and indicate that parameter would be any data type.
import 'package:test/test.dart';

class Cache<T> {
  Map<String, T> _cache;

  ///  return value which is any (T)  data type.
  T getByKey(String key) {
    if (_cache.containsKey(key)) {
      return _cache[key];
    }
    return null;
  }

  /// store any (T) data type value.
  void setByKey(String key, T value) {
    _cache[key] = value;
  }

  Cache() {
    _cache ??= {};
  }
}

void main() {
  group('Using Cache<String> ->', () {
    var strings;
    setUp(() {
      strings = Cache<String>();
    });

    test('set by key String', () {
      strings.setByKey('one', '1');
      expect(strings.getByKey('one'), '1');
    });

    test('set by key int', () {
      bool result;
      result = false;

      expect(() {
        try {
          strings.setByKey('two', 2);
        } on TypeError {
          result = true;
        } finally {
          expect(result, isTrue);
        }
      }, returnsNormally);
    });
  });

  group('Using Cache<int> ->', () {
    var numbers;
    setUp(() {
      numbers = Cache<num>();
    });

    test('set by key int', () {
      numbers.setByKey('two', 2);

      expect(numbers.getByKey('two'), 2);
      expect(numbers.getByKey('one'), isNull);
    });
    test('set by key int', () {
      bool result;
      result = false;

      expect(() {
        try {
          numbers.setByKey('two', '2');
        } on TypeError {
          result = true;
        } finally {
          expect(result, isTrue);
        }
      }, returnsNormally);
    });
  });
}
