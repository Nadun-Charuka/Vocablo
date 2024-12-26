import 'package:flutter/material.dart';
import 'package:vocablo_app/constants/colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF1DE9B6),
      title: const Text("Vocablo Translate",
          style: TextStyle(
            color: kCharcoalGray,
            fontSize: 24,
          )),
      centerTitle: true,
      actions: [
        Icon(
          Icons.account_circle_outlined,
          size: 35,
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
