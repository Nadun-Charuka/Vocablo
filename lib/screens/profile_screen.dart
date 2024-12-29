// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart'; // Import CustomAppbar

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(), // Use CustomAppbar for consistency
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Other profile widgets...
          ],
        ),
      ),
    );
  }
}
