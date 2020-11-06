import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/constants/keys.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeatherForecast(String city) async {
    try {
      String url =
          "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&APPID=$WeatherApiKey";
      //feching weather data
      http.Response response = await http.get(url);
      // converting result to map
      Map<String, dynamic> result = json.decode(response.body);
      // checking if result were return
      // if not send null and ui display error
      if (result == null || result["message"] != null) return null;
      // if weather result was return send data to ui
      return WeatherModel.fromJson(result);
    } catch (e) {
      //sending null for ui to display error
      return null;
    }
  }
}
