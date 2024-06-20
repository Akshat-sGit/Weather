// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart'; 


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
  }

  void getLocation() async {
    Location location = Location(); 
    await location.getCurrentLocation(); 
    print(location.latitude); 
    print(location.longitude); 


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(

          onPressed: () {
            //Get the current location
            getLocation(); 
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}