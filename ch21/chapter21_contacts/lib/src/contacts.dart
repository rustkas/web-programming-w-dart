/// Abstract class to manage contacts.
abstract class Contacts {
  /// Creates a new contact.
  Future add(Map data);

  /// Updates an existing contact.
  Future update(var id, Map data);

  /// Deletes an existing contact.
  Future delete(var id);

  /// Gets data for a given contact id.
  Future get(var id);

  /// Lists the existing contacts.
  Future list();

  /// Search for contacts,
  Future search(String query);
}
