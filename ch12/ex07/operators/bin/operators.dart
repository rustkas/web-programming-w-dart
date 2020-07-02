void main() {
  var a;
  a = 15;
  print(a); // 15
  a *= 3;
  print(a); // 45
  a ~/= 2;
  print(a); // 22
  a %= 3;
  print(a); // 1
  a += 14;
  print(a); // 15
  a -= 7;
  print(a); // 8
  a /= 2;
  print(a); // 4.0
  a = a.toInt();
  a <<= 2;
  print(a); // 16
  a >>= 1;
  print(a); // 8
  a &= 0;
  print(a); // 0
  a ^= 1;
  print(a); // 1
  a != 1;
  print(a); // 1
}
