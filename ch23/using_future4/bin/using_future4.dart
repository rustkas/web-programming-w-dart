import 'dart:async';

int costly_function() => 12;
void main() {
  print('start');
  var fut = Future.delayed(Duration(seconds: 5), costly_function);
  fut.then((v) => print(v));
  for (var i = 0; i < 8; i++) {
    print('Other tasks');
  }
  print('end');
}
