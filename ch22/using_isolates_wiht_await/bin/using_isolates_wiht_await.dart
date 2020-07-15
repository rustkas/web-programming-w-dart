import 'dart:async';
import 'dart:isolate';

void CostlyProcess(SendPort replyTo) {
  var port = ReceivePort();
  replyTo.send(port.sendPort);
  port.listen((msg) {
    var data = msg[0];
    replyTo = msg[1];
    if (data == 'START') {
      replyTo.send('Running costly process....');
      // Costly stuff here
      replyTo.send('END');
      port.close();
    }
  });
}

Future<void> main() async {
  // Start application
  print('Start application');

  // Create the reply port for the isolate.
  final isolate_reply = ReceivePort();

  // We’ll run the costly process in an Isolate.
  Isolate iso;
  iso = await Isolate.spawn(CostlyProcess, isolate_reply.sendPort);
  SendPort isolatePort = await isolate_reply.first;

  // Once I’ve created the Isolate, I send the 'START' message and
  // I'm waiting to receive a reply from the main process to execute.
  final big_process_reply = ReceivePort();
  isolatePort.send(['START', big_process_reply.sendPort]);
  big_process_reply.listen((msg) {
    print('Message received from isolate: $msg');
    if (msg == 'END') {
      print('Costly process completed successfully !!!');
      big_process_reply.close();
      iso.kill(priority: Isolate.immediate);
      iso = null;
    }
  });

  print('Continue running instructions');
}
