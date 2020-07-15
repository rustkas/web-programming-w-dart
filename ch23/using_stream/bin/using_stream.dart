void main() {
  print('1. Actions');
  final serie = [1, 2, 3, 4, 5];
  final stream = Stream.fromIterable(serie);
// We subscribe to the events of Stream
  stream.listen((value) {
    print('2. Stream: $value');
  });
  print('3. More actions');
}
