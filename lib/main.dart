import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'components/appbar.dart';
import 'components/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String lastUpdated = 'Never';

  @override
  void initState() {
    super.initState();
    _checkForUpdate();
  }

  Future<void> _checkForUpdate() async {
    final prefs = await SharedPreferences.getInstance();
    final currentDate = DateTime.now().toIso8601String().substring(0, 10);

    String? savedDate = prefs.getString('lastUpdatedDate');

    if (savedDate == null || savedDate != currentDate) {
      setState(() {
        lastUpdated = currentDate;
      });

      await prefs.setString('lastUpdatedDate', currentDate);
    } else {
      setState(() {
        lastUpdated = savedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(pageTitle: "Home"),
      drawer: const MyMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Last update was on:',
              style: TextStyle(fontSize: 30, fontFamily: "Courier"),
            ),
            Text(
              lastUpdated,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Courier"),
            ),
          ],
        ),
      ),
    );
  }
}
