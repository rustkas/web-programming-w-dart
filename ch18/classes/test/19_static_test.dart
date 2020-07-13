import 'package:test/test.dart';

class _CryptoUtils {
  static String bytesToHex(List<int> bytes) {
    final result = StringBuffer();
    for (var part in bytes) {
      result.write('${part < 16 ? '0' : ''}${part.toRadixString(16)}');
    }
    return result.toString();
  }
}

void main() {
  print(_CryptoUtils.bytesToHex([6, 4, 7, 8, 1, 0])); // 060407080100

  test('static method', () {
    expect(_CryptoUtils.bytesToHex([6, 4, 7, 8, 1, 0]), '060407080100');
  });
}
