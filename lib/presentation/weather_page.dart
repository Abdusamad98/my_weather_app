import 'package:flutter/material.dart';
import 'package:my_weather_app/api/models/current/current_weather.dart';
import 'package:my_weather_app/api/services/api_provider.dart';
import 'package:my_weather_app/presentation/weather_detail_page.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key, required this.lon, required this.lat})
      : super(key: key);
  final double lon;
  final double lat;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController searchController = TextEditingController();

  late CurrentWeather currentWeather;
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    isLoading = true;
    setState(() {});
    currentWeather = await ApiProvider.getCurrentWeatherByLatLong(
        latitude: widget.lat, longitude: widget.lon);
    isLoading = false;
    setState(() {});
  }

  Future<void> _update({required String searchText}) async {
    isLoading = true;
    setState(() {});
    try {
      currentWeather =
          await ApiProvider.getCurrentWeatherByText(searchText: searchText);
      isError = false;
      isLoading = false;
      setState(() {});
    } catch (error) {
      isError = true;
      isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
            ),
          ),
          TextButton(
              onPressed: () async {
                _update(searchText: searchController.text);
              },
              child: const Text("Search")),
          Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : isError
                      ? const Text("Error")
                      : Text(currentWeather.toString())),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext contex) {
              return WeatherDetailPage(
                lat: currentWeather.coord.lat,
                lon: currentWeather.coord.lon,
              );
            }),
          );
        },
        child: const Text("More"),
      ),
    );
  }
}
