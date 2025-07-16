import 'package:flutter/material.dart';
import 'package:weatherapp/weatherScreen/ws_adinfo_card.dart';
import 'package:weatherapp/weatherScreen/ws_card.dart';
import 'package:weatherapp/weatherScreen/ws_main_card.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({
    super.key,
  });

  final weatherCards = const SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherScreenCard(
            time: "09:00", icon: Icons.cloud, temperature: "20°C"),
        WeatherScreenCard(
            time: "10:00", icon: Icons.sunny, temperature: "20°C"),
        WeatherScreenCard(
            time: "11:00", icon: Icons.snowing, temperature: "20°C"),
        WeatherScreenCard(
            time: "12:00", icon: Icons.cloud, temperature: "20°C"),
        WeatherScreenCard(
            time: "10:00", icon: Icons.sunny, temperature: "20°C"),
      ],
    ),
  );

  final adInfo = const Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      AddInfo(
          icon: Icon(Icons.water_drop, size: 32),
          title: 'Humidity',
          value: '94%'),
      AddInfo(
          icon: Icon(Icons.air, size: 32), title: 'Wind Speed', value: '7.67'),
      AddInfo(
          icon: Icon(Icons.beach_access, size: 32),
          title: 'Pressure',
          value: '1006'),
      // Text('Humidity: 60%'),
      // Text('Wind Speed: 10 km/h'),
      // Text('Pressure: 1012 hPa'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                // ignore: avoid_print
                print("refresh tapped");
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //for main card
            const WeatherScreenMainCard(
                temperature: "300",
                icon: Icons.cloud,
                weatherCondition: "Rain"),
            //for weather card
            const SizedBox(
              height: 20,
            ),
            const Text('Weather Forecast',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            //for weather forecast card
            weatherCards,
            //for more info card
            const SizedBox(
              height: 20,
            ),
            const Text('Additional Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            adInfo,
          ],
        ),
      ),
    );
  }
}
