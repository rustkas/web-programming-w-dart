import 'dart:async';

Future costly_calculation(Map parameters) {
  if (parameters.isEmpty) {
    return Future.error(Exception('Missing parameters'));
  }
  print('Doing costly calculation...');
  print('At some point we have an error');
  return Future.value(12);
}

void main() {
  costly_calculation({})
      .then((v) => print('Result: $v'))
      .catchError((error) => print('Error: $error'));
}
