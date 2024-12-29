// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocablo_app/widgets/theme_provider.dart';
import '../widgets/custom_appbar.dart'; // Import CustomAppbar

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: const CustomAppbar(), // Use CustomAppbar for consistency
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (bool value) {
                  themeProvider.toggleTheme(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
