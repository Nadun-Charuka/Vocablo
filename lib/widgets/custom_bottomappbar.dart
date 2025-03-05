import 'package:flutter/material.dart';

class SimpleBottomAppBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const SimpleBottomAppBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).appBarTheme.backgroundColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        children: [
          const Spacer(flex: 1),
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
                bottom: 5,
              ),
              child: Icon(
                Icons.menu_book,
                size: 30,
                color: currentIndex == 0
                    ? Colors.black
                    : Theme.of(context).hintColor,
              ),
            ),
            onPressed: () => onTap(0),
          ),
          const Spacer(flex: 8),
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
                bottom: 5,
              ),
              child: Icon(
                Icons.person_2,
                size: 30,
                color: currentIndex == 2
                    ? Colors.black
                    : Theme.of(context).hintColor,
              ),
            ),
            onPressed: () => onTap(2),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
