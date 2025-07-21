import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/weatherScreen/ws_adinfo_card.dart';
import 'package:weatherapp/weatherScreen/ws_card.dart';
import 'package:weatherapp/weatherScreen/ws_main_card.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({
    super.key,
  });

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0.0;
  dynamic data;
  bool isLoading = false;
  late Future<void> _weatherFuture;

  @override
  void initState() {
    super.initState();
    // Fetch weather data when the screen is initialized
    _weatherFuture = fetchWeatherData();
  }

  Future getWeatherDataReal() async {
    // Simulate a network call to fetch weather data
    try {
      String url =
          'https://api.weatherapi.com/v1/current.json?key=YOUR_API_KEY&q=London';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the JSON data
        final data = response.body;
        // You can convert the JSON data to a Dart object here
        // For example, using jsonDecode(data) if you import 'dart:convert';
        return jsonDecode(data); // Return the parsed data
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }

  Future<void> fetchWeatherData() async {
    // Simulate fetching weather data

    final weatherData = await getWeatherData();

    setState(() {
      temp = double.parse(weatherData['temperature']);
      data = weatherData;
      // You can also set other properties like icon and weatherCondition here
    });

    // Use the fetched data to update the UI or state
    // For example, you could setState to update the main card with new data
  }

  Future getWeatherData() async {
    // Simulate a network call to fetch weather data
    // In a real application, you would use an HTTP client to fetch data from a weather API
    await Future.delayed(const Duration(seconds: 2));
    // Return dummy data
    return {
      'temperature': '300',
      'icon': Icons.cloud,
      'weatherCondition': 'Rain',
    };
  }

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
                setState(() {
                  _weatherFuture = fetchWeatherData();
                });
                // ignore: avoid_print
                print("refresh tapped");
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: FutureBuilder(
          future: _weatherFuture,
          builder: (context, snapshot) {
            print(snapshot);
            print(data);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //for main card
                    WeatherScreenMainCard(
                        temperature: temp.toString(),
                        icon: Icons.cloud,
                        weatherCondition: "Rain"),
                    //for weather card
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Weather Forecast',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    //for weather forecast card
                    weatherCards,
                    //for more info card
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Additional Information',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    adInfo,
                  ],
                ),
              );
            }
          }),
    );
  }
}
