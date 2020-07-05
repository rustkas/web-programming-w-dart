void main() {
  const myText = 'Welcome Dart';
  final re = RegExp('e');

  print('text = $myText');
  print('[$re].hasMatch(text) = ${re.hasMatch(myText)}'); // True
  print('[$re].stringMatch(text) = ${re.stringMatch(myText)}'); // e
  print('pattern = ${re.pattern}'); // 'e'
  print('isMultiLine = ${re.isMultiLine}'); // False
  print('isCaseSensitive = ${re.isCaseSensitive}'); // True
  re.allMatches(myText).forEach((m) {
    print('start = ${m.start}; end = ${m.end}');
  });

}
