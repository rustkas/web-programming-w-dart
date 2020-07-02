import 'dart:math';

void main() {
  final rand = Random();

  for (var i = 0; i < 10; i++) {
    print('rand.nextInt(100) = ${rand.nextInt(100)}');
  }
}
