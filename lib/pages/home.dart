import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../components/appbar.dart';
import '../components/menu.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: const Color.fromARGB(255, 213, 64, 64),
              child: Column(
                children: <Widget>[
                  const Text(
                    'Last update was on:',
                    style: TextStyle(fontSize: 20, fontFamily: "Courier"),
                  ),
                  Text(
                    lastUpdated,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Courier",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Column(
                children: [
                  Text('Weather data'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Column(
                children: [
                  Text('Stock prices'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Column(
                children: [
                  Text('Currency prices'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Column(
                children: [
                  Text('News'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
