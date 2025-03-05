import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocablo_app/constants/alignment.dart';
import 'package:vocablo_app/widgets/custom_appbar.dart';
import 'package:vocablo_app/widgets/custom_sized_box.dart';
import 'shared_state.dart'; // Import shared state
import 'dart:convert';

class AddNewScreen extends StatefulWidget {
  @override
  _AddNewScreenState createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  final GoogleTranslator _translator = GoogleTranslator();
  final TextEditingController _textController = TextEditingController();

  String _fromLanguage = 'en'; // Default: English
  String _toLanguage = 'si'; // Default: Sinhala

  String _currentTranslatedWord = " "; // Holds the current translation

  @override
  void initState() {
    super.initState();
    _loadTranslationsFromLocalStorage(); // Load translations on init
  }

  // Load translations from SharedPreferences
  Future<void> _loadTranslationsFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final storedData = prefs.getString('translations');
    if (storedData != null) {
      final List<dynamic> decodedData = jsonDecode(storedData);
      if (mounted) {
        // Ensure the widget is still mounted
        setState(() {
          sharedState.translations.clear();
          sharedState.translations.addAll(
              decodedData.map((item) => Map<String, String>.from(item)));
        });
      }
    }
  }

  void _swapLanguages() {
    setState(() {
      String temp = _fromLanguage;
      _fromLanguage = _toLanguage;
      _toLanguage = temp;
      _currentTranslatedWord = " ";
      _textController.clear();
    });
  }

  void _translateText(String text) async {
    if (text.isNotEmpty) {
      final translation = await _translator.translate(
        text + " ",
        from: _fromLanguage,
        to: _toLanguage,
      );

      // Check if the widget is still mounted before calling setState
      if (mounted) {
        setState(() {
          _currentTranslatedWord = translation.text;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _currentTranslatedWord = "";
        });
      }
    }
  }

  void _addToList() async {
    if (_textController.text.isNotEmpty && _currentTranslatedWord.isNotEmpty) {
      setState(() {
        sharedState.translations.add({
          "original": _textController.text,
          "translated": _currentTranslatedWord,
        });
        _textController.clear();
        _currentTranslatedWord = "";
      });
      await sharedState.saveToLocalStorage();

      // Ensure no setState is called after dispose
      if (mounted) {
        setState(() {});
      }
    }
  }

  Widget _buildDropdown(String value, void Function(String?) onChanged) {
    return DropdownButton<String>(
      value: value,
      items: const [
        DropdownMenuItem(value: 'en', child: Text('English')),
        DropdownMenuItem(value: 'si', child: Text('Sinhala')),
        DropdownMenuItem(value: 'ko', child: Text('Korean')),
        DropdownMenuItem(value: 'ja', child: Text('Japanese')),
      ],
      onChanged: (String? newValue) {
        if (newValue != null) {
          onChanged(newValue);
          _translateText(_textController.text);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kdefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input TextField
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .inputDecorationTheme
                      .fillColor, // Use theme's fill color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 30,
                      ),
                  // Use theme's text style
                  controller: _textController,
                  onChanged: _translateText,
                  decoration: InputDecoration(
                    hintText: "Enter text...",
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 30,
                        ), // Use theme's hint text style
                    filled: true,
                    fillColor: Theme.of(context)
                        .inputDecorationTheme
                        .fillColor, // Use theme's fill color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Language Selection Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      _buildDropdown(_fromLanguage, (value) {
                        setState(() => _fromLanguage = value!);
                      }),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.compare_arrows,
                        size: 32, color: Colors.teal),
                    onPressed: _swapLanguages,
                  ),
                  Column(
                    children: [
                      _buildDropdown(_toLanguage, (value) {
                        setState(() => _toLanguage = value!);
                      }),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Translated Word Display
              Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surface, // Use theme's surface color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Display the translated word
                    Expanded(
                      child: Text(
                        _currentTranslatedWord.isNotEmpty
                            ? _currentTranslatedWord
                            : "",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 35,
                            ), // Use theme's text style
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Copy to Clipboard Icon
                    IconButton(
                      onPressed: () {
                        if (_currentTranslatedWord.isNotEmpty) {
                          Clipboard.setData(
                              ClipboardData(text: _currentTranslatedWord));

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Translated word copied to clipboard!"),
                              behavior: SnackBarBehavior
                                  .floating, // Make Snackbar float
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          );
                        }
                      },
                      icon: Icon(
                        Icons.copy,
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Use theme's primary color
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Add to List Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _addToList,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .primary, // Use theme's primary color
                    foregroundColor: Theme.of(context)
                        .colorScheme
                        .onPrimary, // Use theme's onPrimary color
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelLarge, // Use theme's button text style
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Add to List"),
                ),
              ),
              CustomSizedBox2(),

              // Translation List (Latest 5 Words)
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: sharedState.latestTranslations.length,
                reverse: true,
                itemBuilder: (context, index) {
                  final item = sharedState.latestTranslations[index];
                  return Card(
                    color: Theme.of(context).cardTheme.color,
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
            ],
          ),
        ),
      ),
    );
  }
}
