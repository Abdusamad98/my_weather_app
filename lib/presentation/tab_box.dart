import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:my_weather_app/api/models/current/current_weather.dart';
import 'package:my_weather_app/api/services/api_provider.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  _init() async {
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
    print("${_locationData.latitude}" + " AND " + "${_locationData.longitude}");
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: FutureBuilder(
        future: ApiProvider.getOneCallApi(),
        builder:
            (BuildContext context, AsyncSnapshot<CurrentWeather> snapshot) {
          if (snapshot.hasData) {
            var oneCallData = snapshot.data!;
            return Center(
              child: Text(oneCallData.name.toString()),
            );
          } else
            return Center(
              child: Text("Error"),
            );
        },
      ),
    );
  }
}
