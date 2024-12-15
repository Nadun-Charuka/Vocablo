import 'package:flutter/material.dart';
import 'package:vocablo_app/all_colors_page.dart';
import 'package:vocablo_app/home_page.dart';
import 'package:vocablo_app/translation_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    const HomePage(),
    TranslatorScreen(),
    const AllColorsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1DE9B6), // Vibrant Teal
        scaffoldBackgroundColor: const Color(0xFFF1F1F1), // Soft Light Gray
        textTheme: const TextTheme(
          bodyLarge:
              TextStyle(color: Color(0xFF2F4F4F)), // Dark Slate Gray Text
          bodyMedium: TextStyle(color: Color(0xFF1DE9B6)), // Teal Text
          titleLarge:
              TextStyle(color: Color(0xFF2F4F4F)), // Dark Slate Gray for titles
          bodySmall: TextStyle(
              color: Color(0xFF616161)), // Charcoal Gray for secondary text
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFFFF6F61), // Coral Button Color
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(
                secondary: const Color(0xFF3D5AFE)) // Light Indigo Accent Color
            .copyWith(
                surface: const Color(
                    0xFFF1F1F1)), // Surface color (matches background)
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF1DE9B6), // Vibrant Teal
          selectedItemColor: const Color(0xFF3D5AFE), // Light Indigo
          unselectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Practice',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        body: _pages[_currentIndex],
      ),
    );
  }
}
