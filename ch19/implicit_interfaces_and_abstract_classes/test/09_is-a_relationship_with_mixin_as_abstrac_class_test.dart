import 'package:test/test.dart';

// mixin
abstract class JSONSupport {
  String convertToJSON() => 'Converting to JSON object ...';
  String sendToBackend() => 'Sending to Backend ...';
}

class Product extends Object with JSONSupport {
  String name;
  double price;
  Product(this.name, this.price);
}

class Disc extends Product {
  String artist;
  String title;
  Disc(String name, double price, this.artist, this.title) : super(name, price);
}

class Book extends Product {
  String isbn;
  String author;
  String title;
  Book(String name, double price, this.isbn, this.author, this.title)
      : super(name, price);
}

void main() {
  group('is-a relationship ->', () {
    Disc d;
    Book b;

    setUp(() {
      d = Disc('Planes, trains and Eric', 19.95, 'Eric Clapton',
          'Planes, trains and Eric');
      b = Book('Web Programming with Dart', 31.99, '978-1-484205-57-0',
          'Moises Belchin & Patricia Juberias', 'Web Programming with Dart');
    });

    test('Disc', () {
      expect(d, isA<Product>());
      expect(d.name, 'Planes, trains and Eric');
      expect(d.price, 19.95);
      expect(d.artist, 'Eric Clapton');
      expect(d.title, d.name);

      expect(d.convertToJSON(), 'Converting to JSON object ...');
      expect(d.sendToBackend(), 'Sending to Backend ...');
    });
    test('Book', () {
      expect(b, isA<Product>());
      expect(b.name, 'Web Programming with Dart');
      expect(b.price, 31.99);
      expect(b.isbn, '978-1-484205-57-0');
      expect(b.author, 'Moises Belchin & Patricia Juberias');
      expect(b.title, b.name);

      expect(b.convertToJSON(), 'Converting to JSON object ...');
      expect(b.sendToBackend(), 'Sending to Backend ...');
    });
  });
}
