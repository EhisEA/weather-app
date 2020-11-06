import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherService {
  getWeatherForecast(String city) async {
    try {
      String url =
          "https://api.openweathermap.org/data/2.5/weather?q=Londo,uk&units=metric&APPID=946b9f2606654e72eae72e7146cd6150";

      http.Response response = await http.get(url);
      print(json.decode(response.body));
    } catch (e) {
      print("error  " + e);
    }
  }
}
