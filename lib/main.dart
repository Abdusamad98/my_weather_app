import 'package:flutter/material.dart';
import 'package:my_weather_app/presentation/tab_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBox(),
    );
  }
}

//flutter packages pub run build_runner build --delete-conflicting-outputs
