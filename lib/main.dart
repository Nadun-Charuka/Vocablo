// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vocablo_app/constants/theme.dart';
import 'package:vocablo_app/screens/practice_screen.dart';
import 'package:vocablo_app/screens/add_new_screen.dart';
import 'package:vocablo_app/screens/profile_screen.dart';
import 'package:vocablo_app/screens/shared_state.dart';

import 'package:vocablo_app/widgets/custom_bottomappbar.dart';

import 'package:vocablo_app/widgets/theme_provider.dart'; // Import ThemeProvider

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await sharedState.loadFromLocalStorage(); // Load stored translations
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
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
      theme: lightTheme, // Defined in theme.dart
      darkTheme: darkTheme, // Defined in theme.dart
      themeMode: themeProvider.themeMode, // Managed by ThemeProvider
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
  PageController controller = PageController();

  final List<Widget> _pages = [
    PracticeScreen(),
    AddNewScreen(),
    const ProfileScreen(),
  ];

  void nextPage(int index) {
    setState(() {
      _currentIndex = index;
      controller.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          nextPage(1);
        },
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        child: Icon(
          Icons.add,
          size: 40,
          color: Theme.of(context).floatingActionButtonTheme.foregroundColor,
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SimpleBottomAppBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          controller.jumpToPage(index);
        },
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        itemBuilder: (context, index) {
          return _pages[_currentIndex];
        },
      ),
    );
  }
}
