import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vocablo_app/constants/alignment.dart';
import 'package:vocablo_app/widgets/custom_appbar.dart';
import 'package:vocablo_app/widgets/custom_sized_box.dart';
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

  void _deleteTranslation(Map<String, String> item) async {
    // Remove the item from the shared state
    sharedState.translations.removeWhere((translation) =>
        translation['original'] == item['original'] &&
        translation['translated'] == item['translated']);

    // Save the updated list to local storage
    await sharedState.saveToLocalStorage();

    // Update the filtered list based on the current search query
    _filterTranslations();

    // Optionally, show a snackbar notification
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Word deleted"),
        behavior: SnackBarBehavior.floating, // Make Snackbar float
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(kdefaultPadding),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search words...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            CustomSizedBox1(),

            // Filtered Translations List
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: filteredTranslations.length,
                itemBuilder: (context, index) {
                  final item = filteredTranslations[index];
                  return Card(
                    color: Theme.of(context).cardTheme.color,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              // Copy to Clipboard Icon
                              IconButton(
                                onPressed: () {
                                  // Copy the text to clipboard
                                  Clipboard.setData(ClipboardData(
                                      text:
                                          "${item['original']} - ${item['translated']}"));
                                  // Show a snackbar notification

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text("Text copied to clipboard!"),
                                      behavior: SnackBarBehavior
                                          .floating, // Make Snackbar float
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  );
                                },
                                icon:
                                    const Icon(Icons.copy, color: Colors.teal),
                              ),
                              // Delete Icon
                              IconButton(
                                onPressed: () {
                                  _deleteTranslation(item);
                                },
                                icon:
                                    const Icon(Icons.close, color: Colors.red),
                              ),
                            ],
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
