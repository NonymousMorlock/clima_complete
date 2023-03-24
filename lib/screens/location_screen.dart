import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, required this.decodedLocationWeather}) : super(key: key);

  final Map<String, dynamic> decodedLocationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weatherModel = WeatherModel();

  late int temperature;
  late String city;
  late String icon;
  late String message;

  @override
  void initState() {

    super.initState();
    updateUI(widget.decodedLocationWeather);
  }

  void updateUI(Map<String, dynamic> json) {
    setState(() {
    double temp = json['main']['temp'];
    temperature = temp.toInt();
    city = json['name'];
    int condition = json['weather'][0]['id'];
    icon = weatherModel.getWeatherIcon(condition);
    message = weatherModel.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    style: flatButton,
                    onPressed: () async {
                      Map<String, dynamic> decodedData = await weatherModel.locationWeatherDecodedData();
                      updateUI(decodedData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    style: flatButton,
                    onPressed: () async {
                      String city = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CityScreen(),
                        ),
                      );
                      Map<String, dynamic> decodedData = await weatherModel.cityWeatherDecodedData(city);
                      updateUI(decodedData);

                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      icon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $city!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

