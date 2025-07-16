import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherScreenMainCard extends StatelessWidget {
  final String temperature;
  final IconData icon;
  final String weatherCondition;

  const WeatherScreenMainCard({
    super.key,
    required this.temperature,
    required this.icon,
    required this.weatherCondition,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: const SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '300*F',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Icon(Icons.cloud, size: 64),
                  SizedBox(height: 16),
                  Text(
                    'Rain',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
