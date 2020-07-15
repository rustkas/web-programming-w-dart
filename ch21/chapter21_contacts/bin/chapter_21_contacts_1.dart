import 'package:chapter21_contacts/contacts.dart';

Future<void> main() async {
  MySQLContacts mysqlContacts;

  var db_connection = await MySQLConnection().connect();
  mysqlContacts = MySQLContacts(db_connection);
  try {
    var id;

    if (await mysqlContacts.dropDB()) {
      var contact = await mysqlContacts.add({'fname': 'Moises'});
      id = contact.insertId;
      print('New table item id is $id');

      // getting info for the give ID contact
      Map map = await mysqlContacts.get(id);

      print(map);

      await mysqlContacts.delete(id);
      map = await mysqlContacts.get(id);
      print('Result is $map');
    }
  } finally {
    await db_connection?.close();
  }
}
