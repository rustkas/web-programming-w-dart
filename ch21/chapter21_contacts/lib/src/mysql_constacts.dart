import 'dart:async';

import 'package:mysql1/mysql1.dart';

import 'contacts.dart';

// Concrete class to manage contacts stored on physical storage using MariaDB.
// sqljocky package is [unidentified] - do not recommended.
// https://pub.dartlang.org/packages/sqljocky
///
// DB structure:
///
/// CREATE DATABASE dbContacts;
/// USE dbContacts;
/// CREATE TABLE contacts (
///    id INT(11) NOT NULL AUTO_INCREMENT,
///    fname VARCHAR(150) NOT NULL,
///    lname VARCHAR(150) NULL,
///    address TEXT NULL,
///    zip VARCHAR(10) NULL,
///    city VARCHAR(150) NULL,
///    country VARCHAR(150) NULL,
///    PRIMARY KEY (id)
/// );
/// );
class MySQLContacts extends Contacts {
  /// default table name.
  String _tableName;

  /// Database connection.
  MySqlConnection _db;

  /// Constructor.
  MySQLContacts(MySqlConnection db, {String table = 'contacts'}) {
    _tableName = table;
    _db = db;
  }

  @override
  Future add(Map data) {
    final c = Completer();
    final fields = data.keys.join(',');
    final q = data.keys.map((_) => '?').join(', ');
    final values = data.values.toList();

    c.complete(
        _db.query('INSERT INTO $_tableName ($fields) VALUES ($q)', values));
    return c.future;
  }

  /// Run INSERT multiple times
  Future addAll(List<Map> list) {
    final data = list.elementAt(0);
    final c = Completer();
    final fields = data.keys.join(',');
    final q = data.keys.map((_) => '?').join(', ');

    List<List<Object>> parameters;
    parameters = [];
    list.forEach((element) {
      parameters.add(element.values.toList());
    });

    c.complete(_db.queryMulti(
        'INSERT INTO $_tableName ($fields) VALUES ($q)', parameters));

    return c.future;
  }

  @override
  Future update(var id, Map data) {
    final c = Completer();
    final fields = data.keys.map((v) => '$v = ?').join(', ');
    final values = data.values.toList();
    values.add(id);

    c.complete(
        _db.query('UPDATE $_tableName SET $fields WHERE id = ?', values));

    return c.future;
  }

  @override
  Future delete(var id) {
    final c = Completer();
    c.complete(_db.query('DELETE FROM $_tableName WHERE id = ?', [id]));

    return c.future;
  }

  @override
  Future get(var id) async {
    var element;
    final results =
        await _db.query('SELECT * FROM $_tableName WHERE id = ?', [id]);

    var it = results.iterator;
    while (it.moveNext()) {
      final map = it.current.asMap();
      element = {
        'fname': map[1],
        'lname': map[2],
        'address': (map[3] as Blob).toString(),
        'zip': map[4],
        'city': map[5],
        'country': map[6]
      };
    }

    return element;
  }

  @override
  Future list() async {
    List<Map> results;
    results = [];
    var values = await _db.query('SELECT * FROM $_tableName');

    var it = values.iterator;
    while (it.moveNext()) {
      final map = it.current.asMap();
      results.add({
        'fname': map[1],
        'lname': map[2],
        'address': (map[3] as Blob).toString(),
        /* TEXT is a Blob */
        'zip': map[4],
        'city': map[5],
        'country': map[6]
      });
    }
    return results;
  }

  /// Deletes all the information on the `contacts` table.
  Future<bool> dropDB() {
    return _db.query('TRUNCATE TABLE $_tableName').then((_) => true);
  }

  /// Closes DB connection.
  Future<dynamic> close() => _db.close();

  @override
  Future search(String query) async {
    query = query.toLowerCase().trim();
    var matches = [];
    var where = """LOWER(fname) like '%$query%' OR 
    LOWER(lname) like '%$query%' OR LOWER(address) like '%$query%' OR 
    LOWER(zip) like '%$query%' OR LOWER(city) like '%$query%' OR 
    LOWER(country) like '%$query%'""";

    final results = await _db.query('SELECT * FROM $_tableName WHERE $where');

    var it = results.iterator;
    while (it.moveNext()) {
      final map = it.current.asMap();
      matches.add({
        'fname': map[1],
        'lname': map[2],
        'address': (map[3] as Blob).toString(),
        'zip': map[4],
        'city': map[5],
        'country': map[6]
      });
    }
    return matches;
  }
}
