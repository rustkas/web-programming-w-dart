import 'package:test/test.dart';

void main() {
  group('using function →', () {
    String greet(String name) {
      return 'Welcome to Dart $name';
    }

    test('use greet', () {
      final greetResult = greet('Developer');
      expect(greetResult, 'Welcome to Dart Developer');
    });
  });
  group('using single statement →', () {
    String greet(String name) => 'Welcome to Dart $name';
    test('use greet', () {
      final greetResult = greet('Developer');
      expect(greetResult, 'Welcome to Dart Developer');
    });
  });

  group('positional optional parameters →', () {
    String greet(String name, [String lastname, num age]) {
      if (lastname != null && age != null) {
        return 'Welcome to Dart $name $lastname you are $age years old.';
      } else {
        return 'Welcome to Dart $name.';
      }
    }

    test('use greet name', () {
      final greetResult = greet('Developer');
      expect(greetResult, 'Welcome to Dart Developer.');
    });
    test('use greet optional parameters', () {
      final name = 'Developer';
      final lastname = 'Kosorukov';
      final age = 21;
      final greetResult = greet(name, lastname, age);
      expect(greetResult,
          'Welcome to Dart $name $lastname you are $age years old.');
    });
    test('variations', () {
      expect(greet('Peter'), 'Welcome to Dart Peter.');
      expect(greet('Peter', 'Smith'), 'Welcome to Dart Peter.');
      expect(greet('Peter', 'Smith', 28),
          'Welcome to Dart Peter Smith you are 28 years old.');
    });
    test('change position of arguments', () {
      expect(greet('Smith', 'Peter'), 'Welcome to Dart Smith.');
      expect(greet('28', 'Peter', 28),
          'Welcome to Dart 28 Peter you are 28 years old.');
//greet(28, 'Peter', 'Smith'); // This will not compiled.
    });
  });

  group('named optional parameters →', () {
    String greeting({String name, String lastname, num age}) {
      final greet = StringBuffer('Welcome to Dart');
      if (name != null) {
        greet.write(' $name');
      }

      if (lastname != null) {
        greet.write(' $lastname');
      }
      if (age != null) {
        greet.write(' you are $age years old.');
      }
      return greet.toString();
    }

    test('using function `greeting` with optional named parameters', () {
      expect(greeting(name: 'Peter'), 'Welcome to Dart Peter');
      expect(greeting(lastname: 'Smith', name: 'Peter'),
          'Welcome to Dart Peter Smith');
      expect(greeting(lastname: 'Smith', age: 29, name: 'Peter'),
          'Welcome to Dart Peter Smith you are 29 years old.');
      expect(greeting(), 'Welcome to Dart');
      expect(greeting(age: 29), 'Welcome to Dart you are 29 years old.');
    });
  });

  group('default values for positional argument →', () {
    String greeting([String name = 'ANONYMOUS']) {
      final greet = StringBuffer('Welcome to Dart');
      if (name != null) {
        greet.write(' $name');
      }
      return greet.toString();
    }

    test('with and without', () {
      expect(greeting(), 'Welcome to Dart ANONYMOUS');
      expect(greeting('John'), 'Welcome to Dart John');
    });
  });

  group('default values named optional arguments →', () {
    String greeting({String name = 'ANONYMOUS'}) {
      final greet = StringBuffer('Welcome to Dart');
      if (name != null) {
        greet.write(' $name');
      }
      return greet.toString();
    }

    test('with and without', () {
      expect(greeting(), 'Welcome to Dart ANONYMOUS');
      expect(greeting(name: 'John'), 'Welcome to Dart John');
    });
  });

  group('Functions can be used as arguments to other functions →', () {
    final list = <String>[];
    void welcome(element) => list.add('Welcome to Dart element $element');

    test('example 1', () {
      final inputList = [1, 2, 3];
      inputList.forEach(welcome);
      expect(list, [
        'Welcome to Dart element 1',
        'Welcome to Dart element 2',
        'Welcome to Dart element 3'
      ]);
    });
  });

  group('wrong number of arguments 1 →', () {
    final list = <String>[];
    void welcome(element, position) =>
        list.add('Welcome to Dart element $element');

    test('example 1', () {
      // ignore: unused_local_variable
      final inputList = [1, 2, 3];
      // inputList.forEach(welcome); // do not compiled
      expect(list, []);
    });
  });

  group('wrong number of arguments 2 →', () {
    final list = <String>[];
    int welcome(element) => element * 2;

    test('example 1', () {
      // ignore: unused_local_variable
      final inputList = [1, 2, 3];
// list.forEach(print(welcome)); // do not compiled
      expect(list, []);
    });
  });

  group('launch function in argument →', () {
    final list = <int>[];
    int welcome(element) => element * 2;

    test('example 1', () {
      final inputList = [1, 2, 3];
      inputList.forEach((i) => list.add((welcome(i))));
      expect(list, [2, 4, 6]);
    });
  });

  group('assign a function to a variable', () {
    final hello = (element) => 'Welcome to Dart element $element';
    test('', () {
      {
        expect(hello(1), 'Welcome to Dart element 1');
      }
    });
  });

  group('function return a number →', () {
    num sum(num a, num b) {
      return a + b;
    }

    test('example', () {
      final result = sum(1, 5);
      expect(result, 6);
    });
  });

  group('function return null →', () {
    void greeting() {}

    test('example', () {
      // ignore: unused_local_variable
      final result = greeting();
      // expect(result, null); //do not compiled
    });
  });

  group(' use a function as a return value for other function →', () {
    String formatNums(num digit) {
      return digit.toStringAsPrecision(3);
    }

    String sum(num a, num b) {
      return formatNums(a + b);
    }

    test('example', () {
      expect(sum(5, 3), '8.00');
      expect(sum(1.34578, 0.7863123), '2.13');
    });
  });

  group('return a function itself →', () {
    dynamic sum(num a) {
      return (b) => a + b;
    }

    test('example', () {
      final sumThree = sum(3);
      expect(sumThree is dynamic Function(dynamic), isTrue);
      expect(sumThree(5), 8);

      expect(sum(3) is dynamic Function(dynamic), isTrue);
      expect(sum(3)(5), 8); // 8
    });
  });

  group('recursive functions. factorial →', () {
    num factorial(num f) {
      if (f < 1) {
        return 1; // base case
      } else {
        return f * factorial(f - 1); // recursive call
      }
    }

    test('example', () {
      expect(factorial(5), 120);
    });
  });

  group('recursive functions. factorial. throw StackOverflow →', () {
    // ignore: unused_element
    num factorial(num f) {
      return f * factorial(f - 1); // recursive call
    }

    test('example', () {
      // factorial(5);
    });
  });
}
