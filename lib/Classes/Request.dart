import 'dart:io';

import 'package:chfclient/main.dart';

class Request {
  static void writer(String write) async {
    if (write != null && write.isNotEmpty) {
      await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
        print('connected writer');
        write = (write.length + 11).toString() + ',Restaurant-' + write;
        serverSocket.write(write);
        serverSocket.flush();
        print('write: ' + write);
        // serverSocket.close();
      });
    } else {
      print("invalid write");
    }
  }

  static Future<String> listener() async {
    String listen = '';
    await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
      print('connected listen');
      serverSocket.listen((socket) {
        listen = String.fromCharCodes(socket).trim().substring(2);
      }).onDone(() {
        print("listen: " + listen);
      });
      // serverSocket.close();
    });
    return listen;
  }

  static Future<String> writerListener(String write) async {
    String listen = '';
    if (write != null && write.isNotEmpty) {
      await Socket.connect(MyApp.ip, 2442).then((serverSocket) {
        print('connected writer');
        write = (write.length + 11).toString() + ',Restaurant-' + write;
        serverSocket.write(write);
        serverSocket.flush();
        print('write: ' + write);
        print('connected listen');
        serverSocket.listen((socket) {
          listen = String.fromCharCodes(socket).trim().substring(2);
        }).onDone(() {
          print("listen: " + listen);
        });
        // serverSocket.close();
      });
    } else {
      print("invalid write");
    }
    return listen;
  }

// static Future<String> writerListener(String write) async {
//   await wLF(write);
//   print('final rec: ' + rec);
//   // e = rec == 'invalid';
//   // print("bool is: " + e.toString());
//   return rec;
// }

// String listener() {
//   lF();
//   return listen;
// }
}
