void main() {
  {
    // ignore: prefer_single_quotes
    var str_1 = "Example of string enclosed in double quotes";
    var str_2 = 'Example of string enclosed in single quotes';
    // You can include a quote type inside another.
    var str_3 = 'This is a "string"';
    // You can escape quotes with backslash.
    var str_4 = 'Escaping \'single quotes\' inside single quotes';
    print('$str_1');
    print('$str_2');
    print('$str_3');
    print('$str_4');
  }

  {
    var my_number = 4000;
    var str_1 = 'Dart is used for more than $my_number people!';
    print(str_1); // Dart is used for more than 4000 people!
  }
  {
    var name = 'John';
    var template = '''
<html>
<head>
<tittle> Dart </tittle>
</head>
<body>
<h1> Welcome to Dart $name !! </h1>
</body>
</html>
''';
    print(template);
  }
  {
    var address = 'Picasso Street, 12'
        'Postal Code: 28001'
        'Madrid'
        'Spain';
    print(address); // Picasso Street, 12 Postal Code: 28001 Madrid Spain
  }
}
