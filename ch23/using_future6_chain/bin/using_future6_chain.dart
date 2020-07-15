import 'dart:async';

Future<int> one() => Future.value(1);
Future<int> two() => Future.value(2);
Future<int> three() => Future.value(3);
void main() {
  one().then((v) {
    print('Result from one: $v');
    two().then((v) {
      print('Result from two: $v');
      three().then((v) {
        print('Result from three: $v');
        print('End');
      });
    });
  });
}
