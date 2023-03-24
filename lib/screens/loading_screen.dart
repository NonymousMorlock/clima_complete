import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  void getLocation() async {
    Map<String, dynamic> decodedData = await WeatherModel().locationWeatherDecodedData();
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LocationScreen(decodedLocationWeather: decodedData,),
      ),
    );
  }

  void getData() async {

  }


  @override
  initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpinKitPulse(
        color: Colors.white,
        size: 100,
      ),
    );
  }
}
