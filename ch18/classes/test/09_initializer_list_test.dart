import 'package:test/test.dart';

class User {
  String name;
  String password;
  bool loggedin = false;
  User.fromJSON(Map json)
      : name = json['name'],
        loggedin = true,
        password = json['password'] {
    print('User initialized');
  }
}

void main() {
  final user = User.fromJSON({'name': 'admin', 'password': 123.toString()});

  test('check instance member data', () {
    expect(user.name, 'admin');
    expect(user.password, '123');
    expect(user.loggedin, true);
  });
}
