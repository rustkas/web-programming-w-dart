import 'package:test/test.dart';

/// Override operators
/// < + | [] >
/// / ^ []= <= ~/
/// & ~ >= * <<
/// == - % >>
class GPS {
  num latitude;
  num longitude;
  GPS(this.latitude, this.longitude);
  GPS operator +(GPS g) {
    return GPS(latitude + g.latitude, longitude + g.longitude);
  }

  GPS operator -(GPS g) {
    return GPS(latitude - g.latitude, longitude - g.longitude);
  }

  bool operator <(GPS g) {
    return latitude + longitude < g.latitude + g.longitude;
  }

  bool operator >(GPS g) {
    return latitude + longitude > g.latitude + g.longitude;
  }

  bool operator <=(GPS g) {
    return latitude + longitude <= g.latitude + g.longitude;
  }

  bool operator >=(GPS g) {
    return latitude + longitude >= g.latitude + g.longitude;
  }

  @override
  bool operator ==(Object g) {
    return this == g;
  }
}

void main() {
  final g1 = GPS(40.311235, 32.87578786);
  final g2 = GPS(38.642331, 41.79786401);

  test('+', () {
    final g3 = g1 + g2;

    expect(g3.latitude, g1.latitude + g2.latitude);
    expect(g3.longitude, g1.longitude + g2.longitude);
  });
  test('-', () {
    final g3 = g1 - g2;

    expect(g3.latitude, g1.latitude - g2.latitude);
    expect(g3.longitude, g1.longitude - g2.longitude);
  });
}
