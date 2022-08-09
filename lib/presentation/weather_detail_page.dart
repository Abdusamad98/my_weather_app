import 'package:flutter/material.dart';
import 'package:my_weather_app/api/models/one_call/one_call_data.dart';
import 'package:my_weather_app/api/services/api_provider.dart';

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
        title: const Text("Weather App"),
      ),
      body: ListView(
        children: [
          Expanded(
            child: FutureBuilder(
              future: ApiProvider.getOneCallByLatLong(
                latitude: widget.lat,
                longitude: widget.lon,
              ),
              builder:
                  (BuildContext context, AsyncSnapshot<OneCallData> snapshot) {
                if (snapshot.hasData) {
                  var oneCallData = snapshot.data!;
                  return Expanded(
                    child: Text(
                      oneCallData.toString(),
                      style: const TextStyle(fontSize: 25),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
