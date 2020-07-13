import 'package:test/test.dart';

// Abstract class for all the musical instruments.
abstract class Instrument {
  String name;
  void play();
}

// Abstract class for all the stringed instruments.
abstract class StringedInstrument extends Instrument {
  int number_of_strings;
}

// Concrete class for electric guitars.
class ElectricGuitar extends StringedInstrument {
  @override
  String name;
  @override
  int number_of_strings;
  ElectricGuitar(this.name, this.number_of_strings);
  @override
  String play() {
    return '$name Electric Guitar with $number_of_strings strings playing rock!';
  }
}

// Concrete class for Spanish guitars
class SpanishGuitar extends StringedInstrument {
  @override
  String name;
  @override
  int number_of_strings;
  SpanishGuitar(this.name, this.number_of_strings);
  @override
  String play() {
    return '$name Spanish Guitar with $number_of_strings strings playing flamenco!';
  }
}

// Concrete class for bass
class BassGuitar extends StringedInstrument {
  @override
  String name;
  @override
  int number_of_strings;
  BassGuitar(this.name, this.number_of_strings);
  @override
  String play() {
    return '$name Bass Guitar with $number_of_strings strings playing Jazz!';
  }
}

void main() {
  group('use abstract classes ->', () {
    ElectricGuitar eg;
    SpanishGuitar sg;
    BassGuitar bg;

    setUp(() {
      eg = ElectricGuitar('Fender', 6);
      sg = SpanishGuitar('Manuel Rodriguez', 6);
      bg = BassGuitar('Ibanez', 4);
    });

    test('ElectricGuitar', () {
      expect(eg.play(), 'Fender Electric Guitar with 6 strings playing rock!');
    });
    test('SpanishGuitar', () {
      expect(sg.play(),
          'Manuel Rodriguez Spanish Guitar with 6 strings playing flamenco!');
    });
    test('BassGuitar', () {
      expect(bg.play(), 'Ibanez Bass Guitar with 4 strings playing Jazz!');
    });
  });
}
