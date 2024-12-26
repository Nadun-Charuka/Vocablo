import 'package:flutter/material.dart';
import 'package:vocablo_app/constants/colors.dart';
import 'package:vocablo_app/screens/practice_screen.dart';
import 'package:vocablo_app/screens/add_new_screen.dart';
import 'package:vocablo_app/screens/profile_screen.dart';

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
  PageController controller = PageController();

  final List<Widget> _pages = [
    const PracticeScreen(),
    AddNewScreen(),
    const ProfileScreen(),
  ];

  void nextPage(index) {
    setState(() {
      _currentIndex = index;
      controller.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kSoftLightGray,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: kVibrantTeal,
          onPressed: () {
            nextPage(1);
          },
          child: Icon(
            Icons.add,
            color: _currentIndex == 1 ? Colors.black : kCharcoalGray,
            size: 40,
          ),
        ),
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          height: kBottomNavigationBarHeight,
          color: kVibrantTeal,
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: Row(
            children: [
              Spacer(
                flex: 1,
              ),
              IconButton(
                onPressed: () {
                  nextPage(0);
                },
                icon: Icon(
                  Icons.menu_book,
                  size: 30,
                  color: _currentIndex == 0 ? Colors.black : kCharcoalGray,
                ),
              ),
              Spacer(
                flex: 8,
              ),
              IconButton(
                onPressed: () {
                  nextPage(2);
                },
                icon: Icon(
                  Icons.person_2,
                  size: 30,
                  color: _currentIndex == 2 ? Colors.black : kCharcoalGray,
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
        body: PageView.builder(
          controller: controller,
          itemBuilder: (context, index) {
            return _pages[_currentIndex];
          },
        ),
      ),
    );
  }
}
