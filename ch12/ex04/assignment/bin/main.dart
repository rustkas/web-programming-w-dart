void main() {
  var a;
  a = 15;
  print('a = $a');
  print('--------------------');
  print('a = $a'); // 15
  a *= 3;
  print('a *= 3 -> $a'); // 45
  a ~/= 2;
  print('a ~/= 2 -> $a'); // 22
  a %= 3;
  print('a %= 3 -> $a'); // 1
  a += 14;
  print('a += 14 -> a'); // 15
  a -= 7;
  print('a -= 7 -> $a'); // 8
  a /= 2;
  print('a /= 2 -> $a'); // 4.0
  a = a.toInt();
  a <<= 2;
  print('a <<= 2 -> $a \t| Bitwise left-shift assignment'); // 16
  a >>= 1;
  print('a >>= 1 -> $a \t| Bitwise right-shift assignment'); // 8
  a &= 0;
  print('a &= 0 -> $a \t| Bitwise AND assignment'); // 0
  a ^= 1;
  print('a ^= 1 -> $a \t| Bitwise XOR assignment'); // 1
  a != 1;
  print('a != 1 -> $a \t| Bitwise OR assignment'); // 1
}
