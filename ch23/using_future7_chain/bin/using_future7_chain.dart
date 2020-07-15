Future<int> one() => Future.value(1);
Future<int> two() => Future.value(2);
Future<int> three() => Future.value(3);
void main() {
  one().then((oneValue) {
    print('Result from one: $oneValue');
    return two();
  }).then((twoValue) {
    print('Result from two: $twoValue');
    return three();
  }).then((threeValue) {
    print('Result from three: $threeValue');
    print('End');
  });
}
