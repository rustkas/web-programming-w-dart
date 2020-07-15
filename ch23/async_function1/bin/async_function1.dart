import 'dart:async';

Future getUser() {
  final c = Completer();
  c.complete({'user': 'Moises'});
  return c.future;
}

void main() {
  print('1. Doing some stuff');
  var u = getUser();
  u.then((v) {
    print('2. Result future.');
    print(v['user']);
  });
  print('3. Doing more stuff');
}
