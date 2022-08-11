import 'package:flutter/material.dart';
import 'package:my_weather_app/api/models/current/current_weather.dart';

class CurrentWeatherData extends SliverPersistentHeaderDelegate {
  CurrentWeatherData({required this.currentWeather});

  final CurrentWeather currentWeather;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      height: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 10,
                blurRadius: 10,
                offset: const Offset(1, 5),
                color: Colors.black.withOpacity(0.3))
          ],
          borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(currentWeather.toString()),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 300;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
