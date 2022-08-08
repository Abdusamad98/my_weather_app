import 'package:flutter/material.dart';

class WeatherDetailPage extends StatefulWidget {
  const WeatherDetailPage({Key? key, required this.lon, required this.lat})
      : super(key: key);

  final double lon;
  final double lat;

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather detail page"),
      ),
    );
  }
}
