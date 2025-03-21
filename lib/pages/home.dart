import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../components/appbar.dart';
import '../components/menu.dart';
import '../utils/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String lastUpdated = 'Never';
  String temperature = '';

  @override
  void initState() {
    super.initState();
    _checkForUpdate();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    final prefs = await SharedPreferences.getInstance();
    final currentDate = DateTime.now().toIso8601String().substring(0, 10);

    String? savedDate = prefs.getString('lastUpdatedDate');

    if (savedDate == null || savedDate != currentDate) {
      setState(() async {
        try {
          String temp = await getTemperature("Budapest");
          setState(() {
            temperature = temp;
          });
          lastUpdated = currentDate;
        } catch (e) {
          setState(() {
            temperature = 'Error, report the bug on Discord';
          });
        }
      });
      await prefs.setString('lastUpdatedDate', currentDate);
    } else {
      setState(() {
        lastUpdated = savedDate;
      });
    }
  }

  Future<void> _checkForUpdate() async {}

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
              child: Column(
                children: [
                  Text("Weather:"),
                  temperature.isEmpty
                      ? const CircularProgressIndicator()
                      : Text(
                          temperature,
                          style: const TextStyle(fontSize: 20),
                        ),
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
