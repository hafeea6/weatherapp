import 'dart:ui';

import 'package:flutter/material.dart';
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
      ],
    ),
  );

  // final mainCard = Card(
  //   elevation: 10,
  //   shape: const RoundedRectangleBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(20)),
  //   ),
  //   child: ClipRRect(
  //     borderRadius: const BorderRadius.all(Radius.circular(20)),
  //     child: BackdropFilter(
  //       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
  //       child: const SizedBox(
  //         width: double.infinity,
  //         child: Padding(
  //           padding: EdgeInsets.all(16.0),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text(
  //                 '300*F',
  //                 style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
  //               ),
  //               SizedBox(height: 16),
  //               Icon(Icons.cloud, size: 64),
  //               SizedBox(height: 16),
  //               Text(
  //                 'Rain',
  //                 style: TextStyle(fontSize: 20),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),
  // );

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
            const Placeholder(
              fallbackHeight: 150,
            )
          ],
        ),
      ),
    );
  }
}
