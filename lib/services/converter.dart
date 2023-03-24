

class Converter {
  double temp;
  int condition;
  String city;

  Converter({required this.temp, required this.condition, required this.city});

  factory Converter.fromJson(Map<String, dynamic> json) {
    return Converter(
      temp: json['main']['temp'],
      condition: json['weather'][0]['id'],
      city: json['name'],
    );
  }


}