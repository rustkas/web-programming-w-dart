import 'package:chapter21_contacts/contacts.dart';
import 'package:mysql1/mysql1.dart';

import 'package:test/test.dart';

void main() {
  group('add row ->', () {
    MySQLContacts mysqlContacts;

    setUpAll(() async {
      var db_connection;
      db_connection = await MySQLConnection().connect();
      print('Db connection = $db_connection.runtimeType');
      mysqlContacts = MySQLContacts(db_connection);
    });
    tearDownAll(() {
      mysqlContacts?.close();
    });
    test('1', () async {
      if (await mysqlContacts.dropDB()) {
        Results contact = await mysqlContacts.add({'fname': 'Moises'});

        final id = contact.insertId;
        expect(id, 1);
        Map map = await mysqlContacts.get(id);
        expect(map['fname'], 'Moises');
      }
    });
  });

  group('updating contact info ->', () {
    MySQLContacts mysqlContacts;
    int id;
    setUpAll(() async {
      var db_connection;
      db_connection = await MySQLConnection().connect();
      print('Db connection = $db_connection.runtimeType');
      mysqlContacts = MySQLContacts(db_connection);
    });

    setUp(() async {
      if (await mysqlContacts.dropDB()) {
        Results contact = await mysqlContacts.add({'fname': 'Moises'});

        id = contact.insertId;
      }
    });
    tearDownAll(() {
      mysqlContacts?.close();
    });
    test('1', () async {
      await mysqlContacts.update(id, {'fname': 'Moisés', 'lname': 'Belchín'});

      Map map = await mysqlContacts.get(id);
      expect(map['fname'], 'Moisés');
      expect(map['lname'], 'Belchín');
    });
  });

  group('delete an existing contact ->', () {
    MySQLContacts mysqlContacts;
    int id;
    setUpAll(() async {
      var db_connection;
      db_connection = await MySQLConnection().connect();
      print('Db connection = $db_connection.runtimeType');
      mysqlContacts = MySQLContacts(db_connection);
    });

    setUp(() async {
      if (await mysqlContacts.dropDB()) {
        Results contact = await mysqlContacts.add({'fname': 'Moises'});

        id = contact.insertId;
      }
    });
    tearDownAll(() {
      mysqlContacts?.close();
    });
    test('is null', () async {
      await mysqlContacts.delete(id);
      final map = await mysqlContacts.get(id);
      expect(map, isNull);
    });
  });
}
