String formatLog(String msg, {int pos = 2}) {
  var cad = '';
  for (var i = 0; i < pos; i++) {
    cad += '-';
  }
  return '${cad}${msg}';
}

typedef LoggerOutputFunction = String Function(String msg, {int pos});

void main() {
  LoggerOutputFunction log;
  log = formatLog;
  var cad = '2' + log('My test message');
  print(cad);
}
