import 'package:test/test.dart';

class DaVinci {
  final name = 'Leonardo da Vinci';
  const DaVinci();
}

void main() {
  test('check name', () {
    var leo = const DaVinci();
    expect(leo.name, 'Leonardo da Vinci');
  });
}
