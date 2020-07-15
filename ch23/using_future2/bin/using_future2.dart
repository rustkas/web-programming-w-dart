import 'dart:async';

void main() {
  print('1');
  var fut = Future.microtask(() => 12);
  fut.then((v) => print('Result: $v'));
  print('2');
}
