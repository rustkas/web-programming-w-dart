import 'package:chapter21_contacts/contacts.dart';
/// Add multiple contacts to your databases and list all the information
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
    List<Map> results;
    results = await mysqlContacts.list();
    results.forEach((row) => print(row));
  } finally {
    await db_connection?.close();
  }
}
