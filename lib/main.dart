import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/splash_screen.dart';
import 'package:my_weather_app/presentation/task_page.dart';
import 'package:my_weather_app/presentation/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

//   flutter packages pub run build_runner build --delete-conflicting-outputs
