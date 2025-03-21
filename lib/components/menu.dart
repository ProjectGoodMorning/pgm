import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/home.dart';
import '../pages/settings.dart';

class MyMenu extends StatelessWidget implements PreferredSizeWidget {
  const MyMenu({super.key});

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 120,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: isDarkMode
                  ? Color.fromARGB(255, 46, 45, 45)
                  : Color.fromARGB(219, 71, 177, 162)),
          alignment: Alignment.centerLeft,
          child: Text(
            'PGM | Menu',
            style:
                GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
        Divider(),
        ListTile(
          title: Text('Home',
              style: GoogleFonts.poppins(
                  fontSize: 25, fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pop(context);
            _navigateTo(context, const HomePage());
          },
        ),
        Divider(),
        ListTile(
          title: Text('Settings',
              style: GoogleFonts.poppins(
                  fontSize: 25, fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pop(context);
            _navigateTo(context, const SettingsPage());
          },
        ),
        Divider(),
      ],
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
