void main() {
  {
    var empty_list = [];
    print(empty_list); // []
  }
  {
    var empty_list_2_elements = List(2);
    print(empty_list_2_elements); // [null, null]
  }
  {
    var my_filled_list_num = List.filled(3, 0);
    var my_filled_list_str = List.filled(3, 'A');
    var my_filled_list_map = List.filled(3, {});
    print(my_filled_list_num); // [0, 0, 0]
    print(my_filled_list_str); // [A, A, A]
    print(my_filled_list_map); // [{}, {}, {}]

    var my_list_from_another = List.from(my_filled_list_str, growable: true);
    print(my_list_from_another); // [A, A, A]
    my_list_from_another.add('B');
    print(my_list_from_another); // [A, A, A, B]
  }
  {
    var other_list = ['/etc/', '/home/pi/'];
    var my_iterator_list_1 = List.generate(other_list.length, (e) {
      return other_list[e].split('/');
    }, growable: true);
    print(my_iterator_list_1); // [[, etc, ], [, home, pi, ]]
  }
  {
    var other_list = ['/etc/', '/home/pi/'];
    var my_iterator_list_2 = List.generate(other_list.length, (e) {
      return other_list[e].split('/').where((e) => e != '').toList();
    }, growable: true);
    print(my_iterator_list_2); // [[etc], [home, pi]]
  }
  {
    var my_list = [1, 2, 3];
    print(my_list.length);
    my_list.length = 5;
    print(my_list.length); // 5
    print('my_list:');
    my_list.forEach((element) {
      print(element);
    });
    print(my_list.reversed);
  }

  {
    var apps = [
      {'name': 'WordPress', 'version': 4},
      {'name': 'SourceTree', 'version': 2},
      {'name': 'Google Chrome', 'version': 38},
      {'name': 'Safari', 'version': 8},
    ];
    apps.forEach((a) => print(a['name']));
    print('Sort comparable:');
// Sort apps by name ascending
    var compare = (Map<String, Object> a, Map<String, Object> b) =>
        (a['name'] as Comparable).compareTo(b['name']);
    apps.sort(compare);

    apps.forEach((a) => print(a['name']));
  }
}
