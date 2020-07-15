import 'dart:html';
import 'dart:async';

void main() {
  var msg = document.querySelector('#messages');
  Timer.periodic(Duration(seconds: 1), (_) {
    msg.classes.toggle('enlarge');
  });
}
