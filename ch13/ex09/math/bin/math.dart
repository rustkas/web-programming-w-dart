import 'dart:math';

void main() {
  print('e = $e'); // 2.718281828459045
  print('π = $pi'); // 3.141592653589793

  var degrees = 30;
  print('Degrees = $degrees');
  var radians = degrees * (pi / 180); // 0.5235987755982988
  print('Radiants = $radians');
  print('cos($radians) =  ${cos(radians)}'); // 0.8660254037844387
  print('sin($radians) = ${sin(radians)}'); // 0.49999999999999994

  print('tan($radians) = ${tan(radians)}'); // 0.5773502691896257
  print('acos($radians) = ${acos(radians)}'); // 1.0197267436954502
  print('asin($radians) = ${asin(radians)}'); // 0.5510695830994463
  print('atan($radians) = ${atan(radians)}'); // 0.48234790710102493

  print('sqrt(25) = ${sqrt(25)}'); // 5.0
  print('exp(3) = ${exp(3)}'); // 20.085536923187668
  print('log(10) = ${log(10)}'); // 2.302585092994046
  print('pow(2, 3) = ${pow(2, 3)}'); // 8

  print('min(2, 8) = ${min(2, 8)}'); // 2
  print('max(15, 10) = \${max(15, 10)}'); // 15
}
