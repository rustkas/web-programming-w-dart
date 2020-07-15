import 'dart:io';

void main() {
  print('1. Run a request asynchronously ');
  var file = File('response.json');
  var result = file.readAsString();

  result.then((future_result) {
    print('2. The Future has been completed and I get the result.');
    print(future_result);
  }).catchError((_) {
    print('3 Error running the request.');
  });
  print('4. I continue running more actions.');
}
