import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedState {
  static final SharedState _instance = SharedState._internal();
  factory SharedState() => _instance;

  SharedState._internal();

  final List<Map<String, String>> translations = [];

  // SharedPreferences key
  final String _storageKey = "translations";

  // Get the latest 5 translations
  List<Map<String, String>> get latestTranslations => translations.length > 5
      ? translations.sublist(translations.length - 5)
      : translations;

  // Save data to SharedPreferences
  Future<void> saveToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    // Convert the translations list to JSON and save it
    await prefs.setString(_storageKey, jsonEncode(translations));
  }

  // Load data from SharedPreferences
  Future<void> loadFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final storedData = prefs.getString(_storageKey);
    if (storedData != null) {
      // Decode the JSON string and update the translations list
      final List<dynamic> decodedData = jsonDecode(storedData);
      translations.clear();
      translations
          .addAll(decodedData.map((item) => Map<String, String>.from(item)));
    }
  }

  // Add a new translation and save it
  Future<void> addTranslation(String original, String translated) async {
    translations.add({"original": original, "translated": translated});
    await saveToLocalStorage();
  }

  // Delete a translation and save changes
  Future<void> deleteTranslation(Map<String, String> translation) async {
    translations.removeWhere((item) =>
        item['original'] == translation['original'] &&
        item['translated'] == translation['translated']);
    await saveToLocalStorage();
  }
}

final sharedState = SharedState();
