// Address class
class Address {
  /// Instance variable with the address.
  final String _dir;

  /// Simple class constructor.
  Address(this._dir);

  /// Add operator, concatenates our address with more information.
  Address operator +(Address more_info) {
    return Address('$_dir, $more_info');
  }

  /// Overrides Object.toString() method.
  @override
  String toString() => _dir;
}

void main() {
  var adrs = Address('Main street');
  print(adrs); // Main street
  adrs += Address('number 3, 4th floor, Madrid');
  print(adrs); // Main street, number 3, 4th floor, Madrid
}
