import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/UI/home_page.dart';
import 'package:todo_list/UI/start_page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isFirstLaunch = true;

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLaunch = prefs.getBool('isFirstLaunch');

    if (isFirstLaunch == null || isFirstLaunch) {
      // İlk açılış
      await prefs.setBool('isFirstLaunch', false);
      setState(() {
        _isFirstLaunch = true;
      });
    } else {
      // Daha önce açılmış
      setState(() {
        _isFirstLaunch = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskNest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _isFirstLaunch ? const StartPage() : const HomePage(),
    );
  }
}
