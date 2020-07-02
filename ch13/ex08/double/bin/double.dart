void main() {
  num number = -15.84;

  print(number.isFinite); // True
  print(number.isInfinite); // False
  print(number.isNegative); // True
  print(number.isNaN); // False

  print(number.sign); // -1.0
  print(number.abs()); // 15.84
  print(number.floor()); // -16
  print(number.round()); // -16
  print(number.truncate()); // -15
  print(number.ceilToDouble()); // -15.0
  print(number.floorToDouble()); // -16.0
  print(number.roundToDouble()); // -16.0
  print(number.truncateToDouble()); // -15.0
  number = 3.14159265358979;
  print(number.toStringAsExponential(6)); // 3.141593e+0
  print(number.toStringAsFixed(4)); // 3.1416
  print(number.toStringAsPrecision(2)); // 3.1

  number = 18;
  var result = 18.remainder(2.5);
  print(result); // shows 0.5
  number = 18;
  print(number.clamp(1, 9)); // 9
  print(number.clamp(10, 30)); // 18
  print(number.clamp(18, 50)); // 18
  number = 15;

  print('Integer values:');
  print((number as int).bitLength); // 4 - binary number 1111

  print((number as int).toRadixString(5)); // 30
  print((number as int).toRadixString(2)); // 1111
  print((number as int).toRadixString(16)); // f
}
