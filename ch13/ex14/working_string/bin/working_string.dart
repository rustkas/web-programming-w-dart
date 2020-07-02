void main() {
  var my_string = 'Welcome to Dart';
  {
    var new_string = my_string.substring(11, 15);
    print(
        'my_string = $my_string\nmy_string.substring(11, 15) = $new_string'); // Dart
  }
  {
    print('my_string[0] = ${my_string[0]}'); // W
  }
  {
    print('my_string.codeUnitAt(0) = ${my_string.codeUnitAt(0)}'); // 87
  }
  {
    print('my_string.codeUnits = ${my_string.codeUnits}');
// [87, 101, 108, 99, 111, 109, 101, 32, 116, 111, 32, 68, 97, 114, 116]
  }
  {
    print('my_string.length = ${my_string.length}'); // 15
  }
  {
    print('my_string.endsWith("t") = ${my_string.endsWith('t')}'); // True
    print('my_string.endsWith("bye") = ${my_string.endsWith('bye')}'); // False
    print(
        'my_string.startsWith("Wel") = ${my_string.startsWith('Wel')}'); // True
    print(
        'my_string.contains(RegExp(r"\\bto\\b")) = ${my_string.contains(RegExp(r'\bto\b'))}'); // True
    print(
        'my_string.contains(RegExp(r"[0-9]")) = ${my_string.contains(RegExp(r'[0-9]'))}'); // False
  }
  {
    print('my_string.indexOf("Dart") = ${my_string.indexOf('Dart')}'); // 11
    print('my_string.indexOf("hello") = ${my_string.indexOf('hello')}'); // -1
    print('my_string.lastIndexOf("a") = ${my_string.lastIndexOf('a')}'); // 12
  }
  {
    print('my_string.isEmpty = ${my_string.isEmpty}'); // False
    print('my_string.isNotEmpty = ${my_string.isNotEmpty}'); // True
  }

  {
    var my_string2 = ' Dart ';
    print('my_string2 =  →|$my_string2|←'); // Dart
    print('my_string2.trimLeft() = →|${my_string2.trimLeft()}|←'); // Dart
    print('my_string2.trimRight() = →|${my_string2.trimRight()}|←'); // Dart
    print('my_string2.trim() = →|${my_string2.trim()}|←');
  }
  {
    var str_num = '12';
    print('str_num = \'${12}\'');
    print('$str_num.padLeft(5, "0") = ${str_num.padLeft(5, '0')}'); // 00012
    str_num = '37546';
    print('$str_num.padLeft(5, "0") = ${str_num.padLeft(5, '0')}'); // 37546
  }
  {
    var name = 'Moises';
    var age = '30';
    var row = '| ${name.padRight(20, '_')}${age.padRight(5, '_')} |';
    print(
        '| \${name.padRight(20, "_")}\${age.padRight(5, "_")} | = $row'); // | Moises______________30___ |
  }
  {
    print(
        'my_string.contains(\'hello\') = ${my_string.contains('hello')}'); // False
    print('my_string.contains("Dart") = ${my_string.contains('Dart')}'); // True
    print(
        "my_string.replaceFirst('to', 'to the amazing') = ${my_string.replaceFirst('to', 'to the amazing')}"); // Welcome to the amazing Dart
    print(
        "my_string.replaceAll('e', '3') = ${my_string.replaceAll('e', '3')}"); // W3lcom3 to Dart
    print(
        "my_string.split('e') = ${my_string.split('e')}"); // [W, lcom, to Dart]
  }
  {
    print('my_string.toLowerCase() = ${my_string.toLowerCase()}'); // welcome to dart
    print('my_string.toUpperCase() = ${my_string.toUpperCase()}'); // WELCOME TO DART
  }
}
