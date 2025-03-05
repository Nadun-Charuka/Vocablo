// lib/widgets/custom_appbar.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocablo_app/widgets/theme_provider.dart';
// Import the colors.dart file

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    // Access the current theme's AppBarTheme
    final appBarTheme = Theme.of(context).appBarTheme;
    // Access the current theme's iconTheme
    final iconTheme = Theme.of(context).iconTheme;
    // Access the current theme's textTheme
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor:
          appBarTheme.backgroundColor, // Use theme's AppBar background color
      title: Center(
        child: Text(
          "Vocablo Translate",
          style: textTheme.titleLarge, // Use theme's titleLarge text style
        ),
      ),

      centerTitle: true,

      actions: [
        IconButton(
          icon: const Icon(
            Icons.account_circle_outlined,
            size: 40,
          ),
          color: iconTheme.color, // Use theme's icon color
          onPressed: () {
            // Define action if needed
          },
        ),
        const SizedBox(
          width: 20,
        ),
        // Switch(
        //   value: isDarkMode,
        //   onChanged: (bool value) {
        //     themeProvider.toggleTheme(value);
        //   },
        // ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
