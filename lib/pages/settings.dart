import 'package:flutter/material.dart';
import '../components/menu.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      drawer: const MyMenu(),
      body: const Center(child: Text("Settings Page")),
    );
  }
}
