import 'package:flutter/material.dart';
import 'package:vocablo_app/widgets/custom_appbar.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Practice page",
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
