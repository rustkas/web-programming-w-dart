class Origin {
  final num x;
  final num y;
  const Origin(this.x, this.y);
}

void main() {
  // ignore: unused_local_variable
  var origin = Origin(1, 1);

  // origin.x = 2; // it is not compiled
  // origin.y = 3; // it is not compiled
}
