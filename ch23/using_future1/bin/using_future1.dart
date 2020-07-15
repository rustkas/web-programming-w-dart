import 'dart:async';

int myfunc() {
  print('Making a lot of stuff here');
  print('...');
  print('...');
  var result = 159;
  return result;
}

void main() {
  print('1');
  var fut = Future(myfunc);
  fut.then((r) => print('Result of myfunc: $r'));
  for (var i = 0; i < 5; i++) {
    print('making other tasks');
  }
}
