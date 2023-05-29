import 'package:flutter/material.dart';
import 'package:weather_app_flutter_monstarlab/utils/functions/convert_unit.dart';

import '../../../../../domain/enums/units.dart';

class CityWeatherCard extends StatelessWidget {
  const CityWeatherCard(
      {super.key,
      required this.cityName,
      required this.aqi,
      required this.description,
      required this.temperature,
      required this.colorStart,
      required this.colorMid,
      required this.colorEnd,
      required this.temperatureUnit,
      required this.temperatureUnitString});

  final String cityName;
  final int aqi;
  final String description;
  final double temperature;
  final Color colorStart;
  final Color colorMid;
  final Color colorEnd;
  final TemperatureUnit temperatureUnit;
  final String temperatureUnitString;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorStart,
              colorMid,
              colorEnd,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 3), // Điều chỉnh vị trí đổ bóng (ngang, dọc)
            ),
          ]),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cityName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                'AQI: $aqi $description',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
          Text(
            '${getTemp(temperature, temperatureUnit).toStringAsFixed(0)} ${temperatureUnitString}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
        ],
      ),
    );
  }
}
