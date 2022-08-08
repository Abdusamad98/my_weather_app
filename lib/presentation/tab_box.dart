import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:my_weather_app/api/models/current/current_weather.dart';
import 'package:my_weather_app/api/models/one_call/one_call_data.dart';
import 'package:my_weather_app/api/services/api_provider.dart';
import 'package:my_weather_app/presentation/weather_detail_page.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  final TextEditingController searchController = TextEditingController();

  late CurrentWeather currentWeather;
  bool isLoading = true;

  @override
  void initState() {
    _update(searchText: "Tashkent");
    super.initState();
  }

  Future<void> _update({required String searchText}) async {
    isLoading = true;
    setState(() {});
    currentWeather =
        await ApiProvider.getCurrentWeatherByText(searchText: searchText);
    isLoading = false;
    setState(() {});
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
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
            ),
          ),
          TextButton(
              onPressed: () async {
                _update(searchText: searchController.text);
              },
              child: Text("Search")),
          Expanded(
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Text(currentWeather.name)),
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
        child: Text("More"),
      ),
    );
  }
}
