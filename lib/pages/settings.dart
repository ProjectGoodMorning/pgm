import 'package:flutter/material.dart';
import '../components/appbar.dart';
import '../components/menu.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(pageTitle: "Settings"),
      drawer: MyMenu(),
      body: Center(
          child: Column(children: <Widget>[
        Text('Settings'),
      ])),
    );
  }
}
