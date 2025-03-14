import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // Default to system theme
  final Box _box = Hive.box('settings'); // Access Hive box

  ThemeProvider() {
    _loadThemeMode();
  }

  ThemeMode get themeMode => _themeMode;

  /// Toggles theme based on user selection
  void toggleTheme(ThemeMode mode) {
    _themeMode = mode;
    _box.put('themeMode', mode.index); // Store theme as an integer (0, 1, 2)
    notifyListeners();
  }

  /// Loads theme mode from Hive storage
  void _loadThemeMode() {
    int? storedTheme = _box.get('themeMode'); // Get stored value
    if (storedTheme != null) {
      _themeMode =
          ThemeMode.values[storedTheme]; // Convert integer to ThemeMode
    }
    notifyListeners();
  }
}
