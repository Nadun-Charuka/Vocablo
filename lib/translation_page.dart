import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatorScreen extends StatefulWidget {
  @override
  _TranslatorScreenState createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  final GoogleTranslator _translator = GoogleTranslator();
  final TextEditingController _textController = TextEditingController();

  String _fromLanguage = 'en'; // Default: English
  String _toLanguage = 'si'; // Default: Sinhala

  String _currentTranslatedWord = " "; // Holds the current translation
  List<Map<String, String>> _translations = []; // ListView storage

  // Function to swap the languages
  void _swapLanguages() {
    setState(() {
      String temp = _fromLanguage;
      _fromLanguage = _toLanguage;
      _toLanguage = temp;
      _currentTranslatedWord = "";
      _textController.clear();
    });
  }

  // Function to translate text and display in the container
  void _translateText(String text) async {
    if (text.isNotEmpty) {
      final translation = await _translator.translate(
        text,
        from: _fromLanguage,
        to: _toLanguage,
      );
      setState(() {
        _currentTranslatedWord = translation.text;
      });
    } else {
      setState(() {
        _currentTranslatedWord = "";
      });
    }
  }

  // Add to ListView
  void _addToList() {
    if (_textController.text.isNotEmpty && _currentTranslatedWord.isNotEmpty) {
      setState(() {
        _translations.add({
          "original": _textController.text,
          "translated": _currentTranslatedWord
        });
        _textController.clear();
        _currentTranslatedWord = "";
      });
    }
  }

  // Dropdown Builder
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
      appBar: AppBar(
        backgroundColor: const Color(0xFF1DE9B6),
        title: const Text("Vocablo Translator",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            // Input TextField
            Container(
              height: 100,
              color: Colors.grey.shade100,
              child: TextField(
                style: TextStyle(fontSize: 35),
                controller: _textController,
                onChanged: _translateText,
                decoration: InputDecoration(
                  hintText: "Enter text...",
                  hintStyle: TextStyle(fontSize: 30),
                  filled: true,
                  fillColor: Colors.grey.shade100,
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
                    //Text("From"),
                    _buildDropdown(_fromLanguage, (value) {
                      setState(() => _fromLanguage = value!);
                    }),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.compare_arrows,
                      size: 32, color: Colors.teal),
                  onPressed: _swapLanguages, // Swap Functionality
                ),
                Column(
                  children: [
                    //Text("To"),
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
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _currentTranslatedWord.isNotEmpty ? _currentTranslatedWord : "",
                style: const TextStyle(fontSize: 35),
              ),
            ),
            const SizedBox(height: 20),

            // Add to List Button
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addToList,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1DE9B6),
                  foregroundColor: Colors.white,
                ),
                child: const Text("Add to List"),
              ),
            ),
            const SizedBox(height: 10),

            // Translation List
            Expanded(
              child: ListView.builder(
                itemCount: _translations.length,
                itemBuilder: (context, index) {
                  final item = _translations[index];
                  return Card(
                    color: Colors.grey.shade200,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(
                          12.0), // Adds some padding around the text
                      child: Text(
                        "${item['original']} - ${item['translated']}", // Displays both original and translated words
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
            ),
          ],
        ),
      ),
    );
  }
}
