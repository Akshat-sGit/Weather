// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart'; 
import 'package:http/http.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState(); 
    getLocation(); 
    getData();
  }

  void getLocation() async {
    Location location = Location(); 
    await location.getCurrentLocation(); 
    print(location.latitude); 
    print(location.longitude); 
  }


 void getData() async {
  // Correctly parse the URL string into a Uri object
  final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=e7a1af4023e0012873f46f40fa4c480e');

  // Await the http GET request
  Response response = await get(url);

  // Check if the request was successful
  if (response.statusCode == 200) {
    // Print the response body if the request was successful
    print(jsonDecode(response.body));
  } else {
    // Print an error message if the request was not successful
    print('Failed to load weather data');
  }
}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: Center(
      //   child: ElevatedButton(

      //     onPressed: () {
      //       //Get the current location
      //       getLocation(); 
      //     },
      //     child: const Text('Get Location'),
      //   ),
      // ),
    );
  }
}