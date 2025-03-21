import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/appbar.dart';
import '../components/menu.dart';
import '../utils/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: const MyAppBar(pageTitle: "Settings"),
      drawer: const MyMenu(),
      body: Center(
          child: Column(children: <Widget>[
        SwitchListTile(
          title: Text("Dark Mode", style: GoogleFonts.poppins(fontSize: 20)),
          value: themeProvider.themeMode == ThemeMode.dark,
          onChanged: (bool value) {
            themeProvider.toggleTheme(value);
          },
        ),
      ])),
    );
  }
}
