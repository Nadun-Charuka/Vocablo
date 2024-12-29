// lib/pages/all_colors_page.dart

import 'package:flutter/material.dart';
import '../constants/colors.dart'; // Import the colors.dart file

class AllColorsPage extends StatelessWidget {
  const AllColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if the current theme is dark or light
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Vocablo App',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: isDarkMode ? kDarkSecondaryColor : kLightSecondaryColor,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: isDarkMode ? kDarkSecondaryColor : kLightSecondaryColor,
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
            child: Text(
              'Click here for more info',
              style: TextStyle(
                color: isDarkMode
                    ? kDarkLinkColor
                    : kTealLink, // Using color constant
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // **Warning Messages**
          Container(
            padding: const EdgeInsets.all(16.0),
            color: isDarkMode
                ? kDarkWarningColor
                : kLightYellowWarning, // Using color constant
            child: Row(
              children: [
                Icon(
                  Icons.warning,
                  color: isDarkMode
                      ? kDarkWarningIconColor
                      : kLightWarningIconColor, // Using color constant
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'This is a warning message',
                    style: TextStyle(
                      color: isDarkMode
                          ? kDarkSlateGray
                          : kDarkSlateGray, // Adjust color as needed
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // **Cards**
          Card(
            color:
                Theme.of(context).cardTheme.color, // Using theme's card color
            elevation: Theme.of(context).cardTheme.elevation,
            shape: Theme.of(context).cardTheme.shape,
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
                  leading: Icon(
                    Icons.check_circle,
                    color: isDarkMode
                        ? kDarkPrimaryColor
                        : kVibrantTeal, // Using color constant
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Loading...',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: 0.5,
                color: isDarkMode
                    ? kDarkPrimaryColor
                    : kVibrantTeal, // Using color constant
                backgroundColor: isDarkMode
                    ? kDarkBackgroundColor
                    : kSoftLightGray, // Using color constant
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: isDarkMode
            ? kDarkPrimaryButtonColor
            : kVibrantTeal, // Using color constant
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
