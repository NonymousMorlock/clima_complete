import 'package:flutter/material.dart';

//  Colours
const kButtonColor = Color(0xFFFFFFFF);

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
  color: kButtonColor,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);


const kTextFieldDecoration = InputDecoration(
  icon: Icon(Icons.location_city, color: Colors.white,),
  fillColor: Colors.white,
  filled: true,
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
);

ButtonStyle flatButton = TextButton.styleFrom(
  primary: Colors.black87,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2),)
  ),
  splashFactory: NoSplash.splashFactory,
);


const kSpinningKitColour = Color(0xFFFFFFFF);
const kSpinningKitSize = 100.0;
const kIconSize = 50.0;
const String kApiKey = '7ac24461729cebc27c38e59b6a449a6a';
const String kOpenWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
