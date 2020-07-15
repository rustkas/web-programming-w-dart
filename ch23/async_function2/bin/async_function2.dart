Future getUser() => Future.value({'user': 'Moises'});
void main() {
  print('1. Doing some stuff');
  var u = getUser();
  u.then((v) {
    print('2. Result future.');
    print(v['user']);
  });
  print('3. Doing more stuff');
}
