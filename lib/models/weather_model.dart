import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    this.locationName,
    this.wind,
    this.cloud,
    this.humidity,
    this.weatherDescription,
    this.temp,
    this.minTemp,
    this.maxTemp,
    this.icon,
  });

  String locationName;
  double wind;
  double cloud;
  double humidity;
  String weatherDescription;
  double temp;
  double minTemp;
  double maxTemp;
  String icon;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        locationName: json["name"],
        wind: json["wind"]["speed"].toDouble(),
        cloud: json["clouds"]["all"].toDouble(),
        humidity: json["main"]["humidity"].toDouble(),
        weatherDescription: json["weather"]["description"],
        temp: json["main"]["temp"].toDouble(),
        minTemp: json["main"]["minTemp_min"].toDouble(),
        maxTemp: json["main"]["temp_max"].toDouble(),
        icon: json["weather"]["icon"],
      );

  Map<String, dynamic> toJson() => {
        "locationName": locationName,
        "wind": wind,
        "cloud": cloud,
        "humidity": humidity,
        "weatherDescription": weatherDescription,
        "temp": temp,
        "minTemp": minTemp,
        "maxTemp": maxTemp,
        "icon": icon,
      };
}
