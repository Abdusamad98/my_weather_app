import 'package:flutter/material.dart';
import 'package:my_weather_app/api/models/current/current_weather.dart';
import 'package:my_weather_app/api/models/one_call/one_call_data.dart';
import 'package:my_weather_app/api/services/api_provider.dart';
import 'package:my_weather_app/presentation/weather_detail_page.dart';
import 'package:my_weather_app/presentation/widgets/current_weather_data.dart';
import 'package:my_weather_app/presentation/widgets/sliver_app_bar.dart';
import 'package:my_weather_app/presentation/widgets/weather_search_view.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key, required this.lon, required this.lat})
      : super(key: key);
  final double lon;
  final double lat;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late CurrentWeather currentWeather;
  late OneCallData oneCallData;
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getFuture(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext contex) {
                return WeatherDetailPage(
                  lat: currentWeather.coord.lat,
                  lon: currentWeather.coord.lon,
                );
              },
            ),
          );
        },
        child: const Text("More"),
      ),
    );
  }

  Widget getFuture() {
    return FutureBuilder(
        future: searchText.isEmpty
            ? ApiProvider.getCurrentWeatherByLatLong(
                latitude: widget.lat,
                longitude: widget.lon,
              )
            : ApiProvider.getCurrentWeatherByText(searchText: searchText),
        builder:
            (BuildContext context, AsyncSnapshot<CurrentWeather> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Error!"),
            );
          }
          currentWeather = snapshot.data!;
          return CustomScrollView(
            slivers: [
              MySliverAppBar(
                onTap: () async {
                  searchText = await showSearch(
                      context: context,
                      delegate: WeatherSearchView(suggestionList: [
                        "Tashkent",
                        "Andijan",
                        "Olmazor",
                        "London",
                        "Asaka",
                        "Chust",
                        "Fergana",
                        "Samarkand",
                        "Bukhara",
                        "Moscow",
                      ]));
                  print("RESULTTTTT:$searchText");
                  // Kevotgan queryni saqlaysiz
                  setState(
                    () {},
                  );
                },
              ),
              SliverPersistentHeader(
                delegate: CurrentWeatherData(currentWeather: currentWeather),
                pinned: true,
              ),
              getOneCallDataFuture(),
            ],
          );
        });
  }

  Widget getOneCallDataFuture() {
    return FutureBuilder(
        future: ApiProvider.getOneCallByLatLong(
          latitude: currentWeather.coord.lat,
          longitude: currentWeather.coord.lon,
        ),
        builder: (context, AsyncSnapshot<OneCallData> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasError) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(snapshot.error.toString()),
              ),
            );
          }
          if (!snapshot.hasData) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text("Error!"),
              ),
            );
          }
          oneCallData = snapshot.data!;
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      oneCallData.hourly[index].dt.toString(),
                      textScaleFactor: 3,
                    ),
                  ),
                );
              },
              childCount: oneCallData.hourly.length,
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
