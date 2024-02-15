import 'package:flutter/material.dart';
import 'package:quizker/MyThemes/my_themes.dart';
import 'package:quizker/screens/my_homepage.dart';
import 'package:quizker/screens/my_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizker',
      theme: lightMode,
      home: const MySplashScreen(),
    );
  }
}
