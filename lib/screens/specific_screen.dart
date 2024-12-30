// lib/screens/specific_screen.dart

import 'package:flutter/material.dart';

class SpecificScreen extends StatefulWidget {
  final String payload;

  SpecificScreen({required this.payload});

  @override
  State<SpecificScreen> createState() => _SpecificScreenState();
}

class _SpecificScreenState extends State<SpecificScreen> {
  @override
  Widget build(BuildContext context) {
    // Parse the payload to determine navigation
    // For example, navigate to a specific translation
    return Scaffold(
      appBar: AppBar(title: Text("Notification Action")),
      body: Center(
        child: Text(
          "You tapped on a notification with payload: ${widget.payload}",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
