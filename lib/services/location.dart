import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      latitude = position.latitude;
      longitude = position.longitude;
      print(latitude);
      print(longitude);
    }
    catch(e) {
      if(kDebugMode) {
        print(e);
      }
    }
  }
}