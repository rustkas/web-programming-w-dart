import 'package:test/test.dart';

class Boss {
  String name;
// cache to store the created instance.
  static final Map<String, Boss> _cache = <String, Boss>{};
  Boss._internal(this.name);
// This is our factory constructor.
  factory Boss(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final boss = Boss._internal(name);
      _cache[name] = boss;
      return boss;
    }
  }
  String sayHello() => 'Hi I\'m $name, the Boss!!';
}

void main() {
  final j1 = Boss('Bruce Springsteen');
  final j2 = Boss('Bruce Springsteen');
  
  test('compare instances', () {
    assert(identical(j1, j2));

    expect(j1.sayHello(), "Hi I'm Bruce Springsteen, the Boss!!");
    expect(j2.sayHello(), "Hi I'm Bruce Springsteen, the Boss!!");
  });
}
