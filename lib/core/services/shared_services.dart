import 'package:shared_preferences/shared_preferences.dart';

// Enum to define the type of data that can be stored or retrieved
enum SetType { string, bool, int, double, stringList }

class SharedServices {

  // Method to set data in SharedPreferences
  // Parameters:
  // - type: The type of data being stored (e.g., string, int, etc.)
  // - key: The key to identify the data
  // - value: The value to be stored
  static Future setData(SetType type, String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();

    // Store the value based on the provided type
    type == SetType.string
        ? prefs.setString(key, value)
        : type == SetType.int
        ? prefs.setInt(key, value)
        : type == SetType.bool
        ? prefs.setBool(key, value)
        : type == SetType.double
        ? prefs.setDouble(key, value)
        : type == SetType.stringList
        ? prefs.setStringList(key, value)
        : null;
  }

  // Method to retrieve data from SharedPreferences
  // Parameters:
  // - type: The type of data being retrieved
  // - key: The key to identify the data
  // Returns:
  // - The data retrieved from SharedPreferences
  static Future getData(SetType type, String key) async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the value based on the provided type
    dynamic data = type == SetType.string
        ? prefs.getString(key)
        : type == SetType.int
        ? prefs.getInt(key)
        : type == SetType.bool
        ? prefs.getBool(key)
        : type == SetType.double
        ? prefs.getDouble(key)
        : type == SetType.stringList
        ? prefs.getStringList(key)
        : null;

    // Print the key and retrieved value for debugging purposes
    print('Key: ${key} Value: ${data}');

    return data;
  }

  // Method to remove data from SharedPreferences
  // Parameters:
  // - key: The key to identify the data to be removed
  static Future removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();

    // Remove the data associated with the given key
    prefs.remove(key);
  }
}
