import 'package:chapter21_contacts/contacts.dart';

/// search for some contacts
Future<void> main() async {
  MySQLContacts mysqlContacts;

  var db_connection = await MySQLConnection().connect();
  mysqlContacts = MySQLContacts(db_connection);
  try {
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

    final query1 = 'madrid';
    List results = await mysqlContacts.search(query1);

    if (results.isNotEmpty) {
      results.forEach((r) => print(r));
    } else {
      print('No results found');
    }

    final query2 = 'cyp';
    results = await mysqlContacts.search(query2);

    if (results.isNotEmpty) {
      results.forEach((r) => print(r));
    } else {
      print('No results found');
    }
  } finally {
    await db_connection?.close();
  }
}
