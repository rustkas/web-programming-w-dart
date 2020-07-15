import 'package:chapter21_contacts/contacts.dart';

import 'package:test/test.dart';

void main() {
  group(
      'search for some contacts ->',
      () {
    MySQLContacts mysqlContacts;

    setUpAll(() async {
      var db_connection;
      db_connection = await MySQLConnection().connect();
      mysqlContacts = MySQLContacts(db_connection);
    });
    setUp(() async {
      await Future.wait([
        mysqlContacts.dropDB(),
        mysqlContacts.add({
          'fname': 'Moises',
          'lname': 'Belchin',
          'address': 'paseo del prado, 28',
          'zip': '28014',
          'city': 'Madrid',
          'country': 'Spain'
        }),
        mysqlContacts.add({
          'fname': 'Patricia',
          'lname': 'Juberias',
          'address': 'Castellana, 145',
          'zip': '28046',
          'city': 'Madrid',
          'country': 'Spain'
        }),
        mysqlContacts.add({
          'fname': 'Peter',
          'lname': 'Smith',
          'address': 'Cyphress avenue',
          'zip': '11217',
          'city': 'Brooklyn',
          'country': 'EEUU'
        }),
      ]);
    });
    tearDownAll(() {
      mysqlContacts?.close();
    });
    test('Madrid', () async {
      final query1 = 'madrid';
      List results = await mysqlContacts.search(query1);
      expect(results, [
        {
          'fname': 'Moises',
          'lname': 'Belchin',
          'address': 'paseo del prado, 28',
          'zip': '28014',
          'city': 'Madrid',
          'country': 'Spain'
        },
        {
          'fname': 'Patricia',
          'lname': 'Juberias',
          'address': 'Castellana, 145',
          'zip': '28046',
          'city': 'Madrid',
          'country': 'Spain'
        }
      ]);
    });

    test('Cyp', () async {
      final query1 = 'cyp';
      List results = await mysqlContacts.search(query1);
      expect(results, [
        {
          'fname': 'Peter',
          'lname': 'Smith',
          'address': 'Cyphress avenue',
          'zip': '11217',
          'city': 'Brooklyn',
          'country': 'EEUU'
        }
      ]);
    });
  });
}
