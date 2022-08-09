import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:my_weather_app/presentation/weather_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  late LocationData _locationData;

  void _init() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    await Future.delayed(Duration(seconds: 2));

    if (_locationData != null) {
      print(
          "LATITUDE :${_locationData.latitude} AND LONGITUDE: ${_locationData.longitude}");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext contex) {
        return WeatherPage(
          lon: _locationData.longitude!,
          lat: _locationData.latitude!,
        );
      }));
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Weather Splash Screen"),
      ),
    );
  }
}
