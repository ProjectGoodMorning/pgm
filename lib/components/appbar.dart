import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle;
  const MyAppBar({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ClipRRect(
      child: AppBar(
        title: Text(
          'PGM | $pageTitle',
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? Colors.white : Colors.black),
        ),
        backgroundColor: isDarkMode
            ? Color.fromARGB(255, 46, 45, 45)
            : Color.fromARGB(219, 71, 177, 162),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
