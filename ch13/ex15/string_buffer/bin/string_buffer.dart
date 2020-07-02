import 'dart:io';

void main() {
  {
    final result = StringBuffer();
    result.write('Welcome ');
    result.write('to ');
    result.write('Dart ');
    result.write('version ${Platform.version.split(' ')[0]}');
    print(result); // Welcome to Dart
    print('\n');
    print('result.length = ${result.length}'); // 27
    print('result.isEmpty = ${result.isEmpty}'); // False
    print('result.isNotEmpty = ${result.isNotEmpty}\n');

    result.writeAll(['. the ', 'new ', 'programming ', 'language']);
    print("result.writeAll(['. the ', 'new ', 'programming ', 'language']) = ");
    print('${result.toString()}\n'); // Welcome to Dart
// version 1.7. the new programming language
    var tmpResult = StringBuffer(result.toString());
    print('result..clear() = |${result..clear()}|'); // '' [Empty string]
    tmpResult.clear();
    print('result.clear()\nresult =|$tmpResult|');
  }
}
