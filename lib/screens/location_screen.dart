// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final dynamic locationWeather;

  const LocationScreen({super.key, this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;
  late String weatherDescription;
  late int humidity;
  late double windSpeed;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      isLoading = false;
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = 'N/A';
        weatherDescription = 'N/A';
        humidity = 0;
        windSpeed = 0.0;
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['name'];
      weatherDescription = weatherData['weather'][0]['description'];
      humidity = weatherData['main']['humidity'];
      windSpeed = weatherData['wind']['speed'];
    });
  }

  Future<void> refreshWeather() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    var weatherData = await weather.getCityWeather(cityName);
    updateUI(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> weatherDetails = [
      {'title': 'Temperature', 'value': '$temperature°'},
      {'title': 'Weather', 'value': weatherDescription},
      {'title': 'Humidity', 'value': '$humidity%'},
      {'title': 'Wind Speed', 'value': '${windSpeed.toStringAsFixed(1)} m/s'},
      {'title': 'Message', 'value': weatherMessage},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Weather", style: kHeadingStyle,),
        actions: [
          IconButton(
            onPressed: refreshWeather,
            icon: const Icon(Icons.refresh, color: Colors.black),
          ),
          IconButton(
            onPressed: () async {
              setState(() {
                isLoading = true;
              });
              var typedName = await Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) {
                    return const CityScreen();
                  },
                ),
              );
              if (typedName != null) {
                await Future.delayed(const Duration(seconds: 3));
                var weatherData = await weather.getCityWeather(typedName);
                updateUI(weatherData);
              } else {
                setState(() {
                  isLoading = false;
                });
              }
            },
            icon: const Icon(Icons.location_city, color: Colors.black,)
          ),
        ],
      ),
      body: isLoading
          ?Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.yellow],
                ),
              ),
            child: const Center(
                child: SpinKitCubeGrid(
                  color: Colors.black,
                  size: 50.0,
                ),
              ),
          )
          : Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.yellow],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      cityName,
                      style: kHeadingStyle.copyWith(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: SafeArea(
                      child: ListView.builder(
                        itemCount: weatherDetails.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                            child: Card(
                              color: Colors.white.withOpacity(0.8),
                              child: ListTile(
                                title: Text(
                                  weatherDetails[index]['title']!,
                                  style: kMessageTextStyle,
                                ),
                                trailing: Text(
                                  weatherDetails[index]['value']!,
                                  style: kMessageTextStyle,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
