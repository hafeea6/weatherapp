import 'package:flutter/material.dart';

class WeatherScreenCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;

  const WeatherScreenCard({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: SizedBox(
          width: 100,
          height: 100,
          child: Column(children: [
            Text(
              time,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 8,
            ),
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(temperature, style: const TextStyle(fontSize: 16)),
          ]),
        ),
      ),
    );
  }
}
