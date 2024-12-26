class SharedState {
  static final SharedState _instance = SharedState._internal();
  factory SharedState() => _instance;

  SharedState._internal();

  // List to store all translations
  final List<Map<String, String>> translations = [];

  // Get the latest 5 translations
  List<Map<String, String>> get latestTranslations => translations.length > 5
      ? translations.sublist(translations.length - 5)
      : translations;

  // Get older translations
  List<Map<String, String>> get olderTranslations => translations.length > 5
      ? translations.sublist(0, translations.length - 5)
      : [];
}

final sharedState = SharedState();
