import 'package:chapter21_contacts/contacts.dart';

import 'package:test/test.dart';

void main() {
  group(
      'Add multiple contacts to your databases and list all the information ->',
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
        mysqlContacts.addAll([{
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
        },
        {
          'fname': 'Peter',
          'lname': 'Smith',
          'address': 'Cyphress avenue',
          'zip': '11217',
          'city': 'Brooklyn',
          'country': 'EEUU'
        }]
      ),]);
    });
    tearDownAll(() {
      mysqlContacts?.close();
    });
    test('check list content', () async {
      List<Map> results;
      results = await mysqlContacts.list();
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
        },
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
