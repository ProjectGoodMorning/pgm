import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          title: const Text("Dark Mode",
              style: TextStyle(fontSize: 20, fontFamily: "Courier")),
          value: themeProvider.themeMode == ThemeMode.dark,
          onChanged: (bool value) {
            themeProvider.toggleTheme(value);
          },
        ),
      ])),
    );
  }
}
