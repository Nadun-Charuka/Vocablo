// lib/pages/all_colors_page.dart

import 'package:flutter/material.dart';
import '../constants/colors.dart'; // Import the colors.dart file

class AllColorsPage extends StatelessWidget {
  const AllColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kVibrantTeal, // Using color constant
        title: Text(
          'Vocablo App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: kLightIndigo, // Using color constant
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: kLightIndigo, // Using color constant
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // **Different Sizes of Text**
          Text(
            'Welcome to Vocablo',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Text(
            'Learning Vocabulary Made Fun!',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),

          // **Buttons**
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: kCoralButton, // Using color constant
            ),
            child: const Text('Primary Action'), // Coral Button Color
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: kLightTealButton, // Using color constant
            ),
            child: const Text('Secondary Action'), // Light Teal Button
          ),
          const SizedBox(height: 20),

          // **Links**
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Click here for more info',
              style: TextStyle(color: kTealLink), // Using color constant
            ),
          ),
          const SizedBox(height: 20),

          // **Warning Messages**
          Container(
            padding: const EdgeInsets.all(16.0),
            color: kLightYellowWarning, // Using color constant
            child: const Row(
              children: [
                Icon(Icons.warning,
                    color: kWarningIconColor), // Using color constant
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'This is a warning message',
                    style: TextStyle(
                        color: kDarkSlateGray), // Using color constant
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // **Cards**
          Card(
            color: kSoftLightGray, // Using color constant
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Title',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'This is some content inside the card.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // **ListView**
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.check_circle,
                    color: kVibrantTeal, // Using color constant
                  ),
                  title: Text(
                    'List Item ${index + 1}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    'Details of item ${index + 1}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // **Progress Bar**
          Column(
            children: [
              Text(
                'Loading...',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              const LinearProgressIndicator(
                value: 0.5,
                color: kVibrantTeal, // Using color constant
                backgroundColor: kSoftLightGray, // Using color constant
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kVibrantTeal, // Using color constant
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
