import 'package:flutter/material.dart';
import 'shared_state.dart'; // Import shared state

class PracticeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Practice"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: sharedState.olderTranslations.length,
        itemBuilder: (context, index) {
          final item = sharedState.olderTranslations[index];
          return Card(
            color: Colors.grey.shade200,
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "${item['original']} - ${item['translated']}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
