import 'package:flutter/material.dart';

class CustomSizedBox1 extends StatelessWidget {
  final double height = 15.0;

  const CustomSizedBox1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class CustomSizedBox2 extends StatelessWidget {
  final double height = 30.0;

  const CustomSizedBox2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
