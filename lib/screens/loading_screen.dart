import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/city_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _controller.repeat();
    loadInitialScreen();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void loadInitialScreen() async {
    // Simulate loading process
    await Future.delayed(const Duration(seconds: 2)); // Simulate delay for loading

    if (!mounted) return;

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const CityScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.yellow],
          ),
        ),
        child: Center(
          child: SpinKitCubeGrid(
            color: Colors.black,
            size: 50.0,
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
