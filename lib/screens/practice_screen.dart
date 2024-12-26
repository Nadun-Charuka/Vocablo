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
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> filteredTranslations = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToTop();
    });
    // Initialize the filtered list with all translations
    filteredTranslations = List.from(sharedState.translations.reversed);
    _searchController.addListener(_filterTranslations);
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0); // Jump to the top of the list
    }
  }

  void _filterTranslations() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredTranslations = List.from(sharedState.translations.reversed);
      } else {
        filteredTranslations = sharedState.translations.reversed
            .where((item) =>
                item['original']!.toLowerCase().contains(query) ||
                item['translated']!.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search words...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // Filtered Translations List
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: filteredTranslations.length,
              itemBuilder: (context, index) {
                final item = filteredTranslations[index];
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
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // Copy to Clipboard Icon
                        IconButton(
                          onPressed: () {
                            // Copy the text to clipboard
                            Clipboard.setData(ClipboardData(
                                text:
                                    "${item['original']} - ${item['translated']}"));
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
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
