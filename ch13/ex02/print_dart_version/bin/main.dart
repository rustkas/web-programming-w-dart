import 'dart:io';

void main() {
  final welcome_text = 'Welcome to Dart';
  String dartVersion;
  {
    final stringArray = Platform.version.split(' ');
    dartVersion = stringArray[0];
  }

  print('$welcome_text $dartVersion');
}
