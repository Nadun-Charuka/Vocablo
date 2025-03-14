import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocablo_app/widgets/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    ThemeMode selectedTheme = themeProvider.themeMode;

    return Scaffold(
      appBar: AppBar(title: const Text("Theme Settings")),
      body: Column(
        children: [
          Text("Select Theme"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// **System Theme Button**
              _themeIconButton(
                icon: Icons.brightness_auto,
                isSelected: selectedTheme == ThemeMode.system,
                onTap: () => themeProvider.toggleTheme(ThemeMode.system),
              ),

              /// **Light Theme Button**
              _themeIconButton(
                icon: Icons.wb_sunny,
                isSelected: selectedTheme == ThemeMode.light,
                onTap: () => themeProvider.toggleTheme(ThemeMode.light),
              ),

              /// **Dark Theme Button**
              _themeIconButton(
                icon: Icons.nights_stay,
                isSelected: selectedTheme == ThemeMode.dark,
                onTap: () => themeProvider.toggleTheme(ThemeMode.dark),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// **Reusable IconButton for Theme Selection**
  Widget _themeIconButton({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: IconButton(
        icon:
            Icon(icon, size: 32, color: isSelected ? Colors.blue : Colors.grey),
        onPressed: onTap,
        tooltip: "Change Theme",
      ),
    );
  }
}
