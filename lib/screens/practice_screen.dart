import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vocablo_app/widgets/custom_appbar.dart';
import 'shared_state.dart'; // Import shared state

class PracticeScreen extends StatefulWidget {
  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Scroll to the top when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToTop();
    });
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0); // Jump to the top of the list
    }
  }

  @override
  Widget build(BuildContext context) {
    // Reverse the translations list to show the latest first
    final reversedTranslations = List.from(sharedState.translations.reversed);

    return Scaffold(
      appBar: const CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          controller: _scrollController, // Attach the scroll controller
          itemCount: reversedTranslations.length,
          itemBuilder: (context, index) {
            final item = reversedTranslations[index];
            return Card(
              color: Colors.grey.shade200,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Display the original and translated text
                    Expanded(
                      child: Text(
                        "${item['original']} - ${item['translated']}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow
                            .ellipsis, // Handle long text gracefully
                      ),
                    ),
                    // Copy to Clipboard Icon
                    IconButton(
                      onPressed: () {
                        // Copy the text to clipboard
                        Clipboard.setData(
                          ClipboardData(
                              text:
                                  "${item['original']} - ${item['translated']}"),
                        );
                        // Show a snackbar notification
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Text copied to clipboard!"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.copy, color: Colors.teal),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose of the controller
    super.dispose();
  }
}
