import 'package:flutter/material.dart';
import 'package:vocablo_app/constants/colors.dart';

class AnimatedBottomAppBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AnimatedBottomAppBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  _AnimatedBottomAppBarState createState() => _AnimatedBottomAppBarState();
}

class _AnimatedBottomAppBarState extends State<AnimatedBottomAppBar> {
  double _scale = 1.0;

  void _animateIcon(Function callback) {
    setState(() {
      _scale = 1.2; // Enlarge icon
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _scale = 1.0; // Shrink icon back
      });
      callback(); // Trigger the page change
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      //height: kBottomNavigationBarHeight,
      color: kVibrantTeal,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        children: [
          const Spacer(flex: 1),
          GestureDetector(
            onTap: () => _animateIcon(() => widget.onTap(0)),
            child: AnimatedScale(
              scale: widget.currentIndex == 0 ? _scale : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.menu_book,
                size: 30,
                color: widget.currentIndex == 0 ? Colors.black : kCharcoalGray,
              ),
            ),
          ),
          const Spacer(flex: 8),
          GestureDetector(
            onTap: () => _animateIcon(() => widget.onTap(2)),
            child: AnimatedScale(
              scale: widget.currentIndex == 2 ? _scale : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.person_2,
                size: 30,
                color: widget.currentIndex == 2 ? Colors.black : kCharcoalGray,
              ),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
