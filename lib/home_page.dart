import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1DE9B6), // Vibrant Teal
        title:
            Text('Vocablo App', style: Theme.of(context).textTheme.titleLarge),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: const Color(0xFF3D5AFE), // Light Indigo
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: const Color(0xFF3D5AFE), // Light Indigo
            onPressed: () {},
          ),
        ],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Testing page",
              style: TextStyle(fontSize: 45),
            ),
          )
        ],
      ),
    );
  }
}
