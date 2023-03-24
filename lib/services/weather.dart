import 'package:clima/utilities/constants.dart';
import '../services/networking.dart';
import '../services/location.dart';

class WeatherModel {

  Future<Map<String, dynamic>> cityWeatherDecodedData(String city) async {
    NetworkHelper network = NetworkHelper('$kOpenWeatherMapURL?q=$city&appid=$kApiKey&units=metric');
    return await network.getDecoder();
  }


  Future<Map<String, dynamic>> locationWeatherDecodedData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper network = NetworkHelper('$kOpenWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');
    Map<String, dynamic> decodedData = await network.getDecoder();
    return decodedData;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
