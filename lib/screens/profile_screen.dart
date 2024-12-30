// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocablo_app/services/notification_service.dart';
import 'package:vocablo_app/widgets/custom_sized_box.dart';
import 'package:vocablo_app/widgets/theme_provider.dart';
import '../widgets/custom_appbar.dart'; // Import CustomAppbar

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TimeOfDay _selectedTime = TimeOfDay(hour: 8, minute: 0); // Default time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

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
            CustomSizedBox2(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Schedule Daily Reminder",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Reminder Time: ${_selectedTime.format(context)}",
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text("Select Time"),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await notificationService.showNotification(
                  id: 0,
                  title: "Test Notification",
                  body: "This is a test notification.",
                  payload: "test_payload",
                );
              },
              child: const Text("Show Test Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
