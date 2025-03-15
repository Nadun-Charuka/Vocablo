// main.dart
import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'package:vocablo_app/constants/theme.dart';
import 'package:vocablo_app/screens/practice_screen.dart';
import 'package:vocablo_app/screens/add_new_screen.dart';
import 'package:vocablo_app/screens/profile_screen.dart';
import 'package:vocablo_app/screens/shared_state.dart';

import 'package:vocablo_app/widgets/theme_provider.dart'; // Import ThemeProvider

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings'); // Open a Hive box for theme settings

  await sharedState.loadFromLocalStorage(); // Load stored translations
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // Changed to StatelessWidget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeProvider.themeMode, // Dynamically applied theme mode

      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          _onTap(1);
        },
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        child: Icon(
          Icons.add,
          size: 40,
          color:
              _currentIndex == 1 ? Colors.black : Theme.of(context).hintColor,
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        height: 70,
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.menu_book, 0),
            SizedBox(
              width: 60,
            ),
            _buildNavItem(Icons.person, 2)
          ],
        ),
      ),
      body: _currentIndex == 0
          ? PracticeScreen()
          : _currentIndex == 1
              ? AddNewScreen()
              : SettingsScreen(),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return IconButton(
      icon: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 5,
          bottom: 5,
        ),
        child: Icon(
          icon,
          size: 30,
          color: index == _currentIndex
              ? Colors.black
              : Theme.of(context).hintColor,
        ),
      ),
      onPressed: () => _onTap(index),
    );
  }
}
