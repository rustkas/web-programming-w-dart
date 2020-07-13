import 'package:test/test.dart';

// Instrument extends from Object
// Has no declared constructors
// Has no calls to super
// It's a Mixin!
abstract class Instrument {
  String name;
  String play() => 'Playing $name ...';
}

// StringedInstrument extends from Object
// Has no declared constructors
// Has no calls to super
// It's a Mixin!
abstract class StringedInstrument {
  int number_of_strings;
  String tune() => 'Tunning $number_of_strings strings instrument ...';
}

// Concrete class for electric guitars.
class ElectricGuitar extends Object with Instrument, StringedInstrument {
  @override
  String name;
  @override
  int number_of_strings;
  ElectricGuitar(this.name, this.number_of_strings);
}

// Concrete class for Spanish guitars
class SpanishGuitar extends Object with Instrument, StringedInstrument {
  @override
  String name;
  @override
  int number_of_strings;
  SpanishGuitar(this.name, this.number_of_strings);
}

// Concrete class for bass
class BassGuitar extends Object with Instrument, StringedInstrument {
  @override
  String name;
  @override
  int number_of_strings;
  BassGuitar(this.name, this.number_of_strings);
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
      expect(eg is ElectricGuitar, isTrue);
      expect(eg is Instrument, isTrue);
      expect(eg is StringedInstrument, isTrue);

      expect(eg.play(), 'Playing Fender ...');
      expect(eg.tune(), 'Tunning 6 strings instrument ...');
    });
    test('SpanishGuitar', () {
      expect(sg is SpanishGuitar, isTrue);
      expect(sg is Instrument, isTrue);
      expect(sg is StringedInstrument, isTrue);

      expect(sg.play(), 'Playing Manuel Rodriguez ...');
      expect(sg.tune(), 'Tunning 6 strings instrument ...');
    });
    test('BassGuitar', () {
      expect(bg is BassGuitar, isTrue);
      expect(bg is Instrument, isTrue);
      expect(bg is StringedInstrument, isTrue);

      expect(bg.play(), 'Playing Ibanez ...');
      expect(bg.tune(), 'Tunning 4 strings instrument ...');
    });
  });
}
