void main() {
  print(int.parse('189')); // returns 189 as int object.
  print(double.parse('15.48')); // returns 15.48 as a double object.
  var int_number = int.parse('15');
  print(int_number); // shows 15 as int object.
  print(int_number is int); // shows true;
  var error_int_number = int.tryParse('15€') ?? 15;
  print(error_int_number); // shows null because it can not parse the string.
  print(error_int_number is int); // shows false.
  var double_number = double.parse('15.42');
  print(double_number); // shows 15.42 as double object.
  print(double_number is double); // shows true;
  print(double_number is num); // shows true;

  var error_double_number = double.tryParse('15.42\$') ?? 15.42;
  print(error_double_number); // shows null because it can not parse the string.
  print(error_double_number is double); // shows true.
}
