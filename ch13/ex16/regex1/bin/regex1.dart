void main() {
  var text = 'Welcome to Dart';
  var re = RegExp(r'\d+');
  print('text = $text');
  print('[$re].hasMatch(text) = ${re.hasMatch(text)}'); // False
  text = 'Welcome to Dart 1.7';
  print('text = $text');
  print('[$re].hasMatch(text) = ${re.hasMatch(text)}'); // True

}
