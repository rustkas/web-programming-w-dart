String formatLog(String msg, {int pos = 2}) {
  var cad = '';
  for (var i = 0; i < pos; i++) {
    cad += '-';
  }
  return '${cad}${msg}';
}

void main() {
  var log = formatLog;
  var cad = '2' + log('My test message');
  print(cad);
}
