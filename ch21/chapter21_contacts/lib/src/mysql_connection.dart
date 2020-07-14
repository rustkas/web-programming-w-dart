
import 'dart:async';

import 'package:mysql1/mysql1.dart';

class MySQLConnection{
/// DB host.
  String _host;

  /// DB port.
  int _port;

  /// Database name.
  String _dbName;

  /// User name.
  String _user;

  /// Password.
  String _password;

  /// Connection settings.
  ConnectionSettings _settings;


/// Constructor.
  MySQLConnection(
      {String host = 'localhost',
      int port = 3306,
      String user = 'root',
      String password = '',
      String db = 'dbContacts'
      }) {
    _host = host;
    _port = port;
    _dbName = db;
    
    _user = user;
    _password = password;

    if (_password != null && _password.isNotEmpty) {
      _settings = ConnectionSettings(
          host: _host,
          port: _port,
          user: _user,
          password: _password,
          db: _dbName);
    } else {
      _settings = ConnectionSettings(
          host: _host, port: _port, user: _user, db: _dbName);
    }
    
  }
  Future connect() async {
    final c = Completer();
    c.complete(await MySqlConnection.connect(_settings));
    return c.future;
  }
}
